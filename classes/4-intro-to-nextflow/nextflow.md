## Nextflow

![nextflow_logo](https://raw.githubusercontent.com/PhilPalmer/lbf-hack-tutorial/master/images/nextflow.png)


**Main outcome:** *During the first session you will build a [FastQC](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/) pipeline to learn the basics of Nextflow including:*
- [Parameters](https://www.nextflow.io/docs/latest/getstarted.html?highlight=parameters#pipeline-parameters)
- [Processes](https://www.nextflow.io/docs/latest/process.html) (inputs, outputs & scripts)
- [Channels](https://www.nextflow.io/docs/latest/channel.html)
- [Operators](https://www.nextflow.io/docs/latest/operator.html)
- [Configuration](https://www.nextflow.io/docs/latest/config.html)


### 1. Installing Nextflow

We have [Conda](https://docs.conda.io/en/latest/) installed so we can run the following to install Nextflow:

```bash
conda init bash
exec -l bash
```

Then create a new conda environment:

```bash
conda create -n class4
conda activate class4
```

And install Nextflow there with:

```bash
conda install -c bioconda nextflow
```

You can then test your installation of Nextflow with:
```
nextflow run hello
```

  
### 2. Nextflow Parameters

Now that we have Nextflow & Docker installed we're ready to run our first script

1. Create a file `main.nf` & open this in your favourite code/text editor
2. In this file write the following:

```nextflow
// main.nf
params.fastq_files_list = false

println "My fastq_files_list: ${params.fastq_files_list}"
```

The first line initialises a new variable (`params.fastq_files_list`) & sets it to `false`
The second line prints the value of this variable on execution of the pipeline.

We can now run this script & set the value of `params.reads` to one of our FASTQ files in the testdata folder with the following command:
```
nextflow run main.nf --fastq_files_list fastq_files_list.csv
```

This should return the value you passed on the command line

#### Recap
Here we learnt how to define parameters & pass command line arguments to them in Nextflow


### 3. Nextflow Processes (inputs, outputs & scripts)

Nextflow allows the execution of any command or user script by using a `process` definition. 

A process is defined by providing three main declarations: 
the process [inputs](https://www.nextflow.io/docs/latest/process.html#inputs), 
the process [outputs](https://www.nextflow.io/docs/latest/process.html#outputs)
and finally the command [script](https://www.nextflow.io/docs/latest/process.html#script).

In our main script we want to add the following:

- input
- output
- script

Here we created the variable `fastq_files_list` which is a `file` from the command line input.

We can then create the process `fastqc` including:
 - the [directive](https://www.nextflow.io/docs/latest/process.html#directives) `publishDir` to specify which folder to copy the output files to 
 - the [inputs](https://www.nextflow.io/docs/latest/process.html#inputs) where we declare a `file` `reads` from our variable `reads`
 - the [output](https://www.nextflow.io/docs/latest/process.html#outputs) which is anything ending in `_fastqc.zip` or `_fastqc.html` which will go into a `fastqc_results` channel
 - the [script](https://www.nextflow.io/docs/latest/process.html#script) where we are running the `fastqc` command on our `reads` variable
 
We can then run our script with the following command:
```bash
nextflow run main.nf --fastq_list fastq_files_list.csv
```


### 4. Nextflow Channels

Channels are the preferred method of transferring data in Nextflow & can connect two processes or operators.

<!--
There are two types of channels:
1. [Queue channels](https://www.nextflow.io/docs/latest/channel.html#queue-channel) can be used to connect two processes or operators. They are usually produced from factory methods such as [`from`](https://www.nextflow.io/docs/latest/channel.html#from)/[`fromPath`](https://www.nextflow.io/docs/latest/channel.html#frompath) or by chaining it with methods such as [`map`](https://www.nextflow.io/docs/latest/operator.html#operator-map). **Queue channels are consumed upon being read.**
2. [Value channels](https://www.nextflow.io/docs/latest/channel.html#value-channel) a.k.a. singleton channel are bound to a single value and can be read unlimited times without consuming there content. Value channels are produced by the value factory method or by operators returning a single value, such us first, last, collect, count, min, max, reduce, sum.
-->


In our main.nf we can add the following:

```groovy
//main.nf

// Re-usable component to create a channel with the links of the files by reading the design file
Channel
    .fromPath(params.fastq_list)
    .ifEmpty { error "No file with list of fastq files to download found at the location ${params.fastq_list}" }
    .splitCsv(sep: ',', skip: 1)
    .map { accession, fastq1, fastq2 -> [ accession, file(fastq1), file(fastq2) ] }
    .set { ch_fastq_files }
    

// Re-usable process skeleton that performs a simple operation, listing files
process fastqc {
  tag "${accession}"
  echo true
  publishDir "results", mode: 'copy'


  input: 
  set val(accession), file(fastq_1), file(fastq_2) from ch_fastq_files_subsetted

  output: 
  file "*_fastqc.{zip,html}" into ch_fastqc_results

  script:
  """
  fastqc $fastq_1 $fastq_2
  """
}

```

The `fastq_list` variable is now equal to a channel which contains the accesion id and paired-end FASTQ data. Therefore, the input declaration has also changed to reflect this by declaring the value `accesion`. This `accesion` can be used as a tag for when the pipeline is run. Also, as we are now declaring two inputs the `set` keyword has to be used. 

To run the pipeline:
```bash
nextflow run main.nf --fastq_list fastq_files_list.csv
```

### 5. Nextflow Configuration

Configuration, such as parameters, containers & resources eg memory can be set in `config` files such as [`nextflow.config`](https://www.nextflow.io/docs/latest/config.html#configuration-file).

For example our `nextflow.config` file might look like this:

```groovy
// nextflow.config contents

docker.enabled = true
params.reads = false

process {
  cpus = 2
  memory = "2.GB"

  withName: fastqc {
    container = "lifebitai/fastqc"
  }
}
```

Here we have enabled docker by default, initialised parameters, set resources & containers. It is best practice to keep these in the `config` file so that they can more easily be set or removed. Containers & `params.reads` can then be removed from `main.nf`.

The pipeline can now be run with the following:
```bash
nextflow run main.nf --fastq_list fastq_files_list.csv
```


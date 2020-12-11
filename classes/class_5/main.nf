#!/usr/bin/env nextflow

// Re-usable componext for adding a helpful help message in our Nextflow script
def helpMessage() {
    log.info"""
    Usage:
    The typical command for running the pipeline is as follows:
    nextflow run main.nf --fastq_list fastq_files_list.csv
    Mandatory arguments:
      --fastq_list                  [file] A comma seperated file with all the fastq files locations
                                    A header is expected, and 3 columns that define the following:
                                    - accession number, identifier for fastq file pair
                                    - link (ftp, https) to the fastq 1
                                    - link (ftp, https) to the fastq 2
                                    
                                    A file could look like this:
                                    accession,fastq_1,fastq_2
                                    ERR908503,ftp://ERR908503_1.fastq.gz,ftp://ERR908503_2.fastq.gz

    """.stripIndent()
}


// Re-usable component to create a channel with the links of the files by reading the design file
Channel
    .fromPath(params.fastq_list)
    .ifEmpty { error "No file with list of fastq files to download found at the location ${params.fastq_list}" }
    .splitCsv(sep: ',', skip: 1)
    .map { accession, fastq1, fastq2 -> [ accession, file(fastq1), file(fastq2) ] }
    .set { ch_fastq_files }
    

// Re-usable process skeleton that performs a simple operation, listing files
process subset_reads {
  tag "${accession}"
  echo true
  publishDir "results/subsetted_reads/", mode: 'copy'


  input: 
  set val(accession), file(fastq_1), file(fastq_2) from ch_fastq_files

  output: 
  set val(accession), file(fastq_1), file(fastq_2) into ch_fastq_files_subsetted

  script:
  """
  seqtk sample -s100 $fastq_1 1000 > ${accession}_subsetted_1000_reads_1.fastq.gz
  seqtk sample -s100 $fastq_2 1000 > ${accession}_subsetted_1000_reads_2.fastq.gz
  """
}

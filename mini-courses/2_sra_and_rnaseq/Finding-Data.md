# Finding Data

If a project was funded through a government agency in Europe or in the USA, it is usually a requirement that those data are deposited in an appropriate resource, such as the Sequence Read Archive or the European Nucleotide Archive

## Sequence Read Archive (SRA)

The [Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) is where most NIH-funded sequencing projects end up.   Most publications require that your data be made available and this repository is a good place to begin -- minimum metadata need to be added to aid in others to make use and sense of what has been deposited

Specifically you need to have BioSample information, BioProject information.

[Bioproject and Biosample Details](https://submit.ncbi.nlm.nih.gov/about/bioproject-biosample/#:~:text=A%20BioProject%20is%20a%20collection,materials%20relating%20to%20experimental%20assays)

## European Nucleotide Archive (ENA)
The [European Nucleotide Archive](https://www.ebi.ac.uk/ena/browser/home) is where most European funded research sequencing projects data end up.   These two archives are synchronized for the most part so you can search one or the other.  The ENA is part of [EMBL-EBI](https://www.ebi.ac.uk/about/our-impact) you can read it here.

## Searching for Sequences

It is difficult to search the SRA with metadata terms but searching with metadata terms is straight forward with the ENA. Try typing into the search window the following terms **"lung cell lines rna-seq"** into the [ENA search window](https://www.ebi.ac.uk/ena/browser/home).   You will see returned a number of experiments that you can feel free to explore.  [ENA searching with broad terms.](../../assets/ENAGettingExperimentsForAnalysisUsingSearch.gif)

Once you have some details. Say a run accession, these are prefaced with SRR, you can search the ENA for more details.  For example, we see from the above one run, but we would like to find perhaps the entire project that is associated with it.  Try typing **SRR11936515** into [ENA search window](https://www.ebi.ac.uk/ena/browser/home) to find more details.   

We see, that the project is **PRJNA637623**, the project identifiers are prefaced with **PRJNA**, like the accessions for a sequence read run are prefaced with **SRR**.  Weirdly, if you click on the PRJNA number in the ENA you will get an error, it is a bug, rather than default to a broader search, it tries to search as the accession, which it is not.   Simply cut and pasting the project identifier into the broader search window, will provide you more details.  As shown here: [ENA to find more details](../../assets/ENAGettingAllRunsAssociatedWithAnSRR.gif)

Now that we know the project number and you would like to know more details say about the project, you can find out about it.  There are like in all things, multiple ways of achieving that end.   I find ENA not the best for getting at those project details, but back at the [Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) you can enter that project number and see the project description provided by the submitter as shown here. [Sequence Read Archive, you can expand on these project details](../../assets/SRAGettingMoreDetailsOnTheProject.gif).  Of course, you should read the paper to get the exact methods. 

## Data Portals

There are also specialty portals through which you can find data sets, such as cancer data sets

*Harmonized Cancer Datasets*
[Genomic Data Commons Data Portal](https://portal.gdc.cancer.gov/)

## SRA Explorer

A real gem for getting the specific download details - which are also multiple - including the SraToolkit.  But if you would like to download the fastq files to your laptop or to a server at your university, you would enjoy using [SRA Explorer](https://sra-explorer.info/).  

In this case, the project **PRJNA637623** is put in the search line of the [SRA Explorer](https://sra-explorer.info).  Feel free to cut and paste the **PRJNA** number into the SRA Explorer window to reproduce those steps.

Also shown in the following gif how to find sequences using this method is [here](../../assets/SRARunExplorerGettingAllRunsForAProject.gif)

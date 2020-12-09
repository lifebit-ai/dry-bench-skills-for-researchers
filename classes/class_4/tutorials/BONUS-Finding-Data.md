# Finding Data

If a project was funded through a government agency in Europe or in the USA, it is usually a requirement that those data are deposited in an appropriate resource, such as the Sequence Read Archive or the European Nucleotide Archive

## Sequence Read Archive (SRA)

The [Sequence Read Archive](https://www.ncbi.nlm.nih.gov/sra) is where most NIH-funded sequencing projects end up.   Most publications require that your data be made available and this repository is a good place to begin -- minimum metadata need to be added to aid in others to make use and sense of what has been deposited

Specifically you need to have BioSample information, BioProject information.

[Bioproject and Biosample Details](https://submit.ncbi.nlm.nih.gov/about/bioproject-biosample/#:~:text=A%20BioProject%20is%20a%20collection,materials%20relating%20to%20experimental%20assays)

## European Nucleotide Archive (ENA)
The [European Nucleotide Archive](https://www.ebi.ac.uk/ena/browser/home) is where most European funded research sequencing projects data end up.   These two archives are synchronized for the most part so you can search one or the other.  The ENA is part of [EMBL-EBI](https://www.ebi.ac.uk/about/our-impact) you can read it here.

## Searching for Sequences

It is difficult to search the SRA with metadata terms but searching with metadata terms is straight forward with [ENA searching with broad terms](../../../assets/ENAGettingExperimentsForAnalysisUsingSearch.gif)

Once you have some details. Say a run accession, these are prefaced with SRR, you can search the [ENA to find more details](../../../assets/ENAGettingAllRunsAssociatedWithAnSRR.gif).   

But once you have that information, you would like to know more details say about the project.  There are like in all things, multiple ways of achieving that end.   I find ENA not the best for getting at those project details, but back at the [Sequence Read Archive, you can expand on these project details](../../../assets/SRAGettingMoreDetailsOnTheProject.gif).  Of course, you should read the paper to get the exact methods. 

## SRA Explorer

A real gem for getting the specific download details - which are also multiple - including the SraToolkit.  But if you would like to download the fastq files to your laptop or to a server at your university, you would enjoy using [SRA Explorer](https://sra-explorer.info/).   Demonstrating how to find sequences using this method is [here](../../../assets/SRARunExplorerGettingAllRunsForAProject.gif)





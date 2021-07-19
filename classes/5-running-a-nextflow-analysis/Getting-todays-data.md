## Todays data
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4317512.svg)](https://doi.org/10.5281/zenodo.4317512)

Today - we used our SraExplorer to subset the data we were interested.  It is a short class, so we wanted a small dataset:

[Targeted human RNASequencing data](https://zenodo.org/record/4317512)

You will find 3 different data sets, which we will use to run the RNA-sequencing Nextflow workflow we forked from the community-based standard group [nf-core](https://nf-co.re/).

## SRA Explorer

1. First we searched with the terms **targeted[All Fields] AND ("Homo sapiens"[Organism] OR human[All Fields])** in [Sra-explorer](https://sra-explorer.info/#)

2. Then we selected a project and we searched with this term **PRJNA564604[All Fields]** also in [Sra-explorer](https://sra-explorer.info/#)

3. Then we selected all the samples, clicked on the **Full Metadata** tab and downloaded these files to our laptop and 
[uploaded them to Zenodo shown in the gif here](../../assets/selectClass5ProjectForRNASeqAnalysisSRAExplorer.gif)

## Selecting only the accessions

The metadata file was edited using emacs - an editor available on most systems, to limit the full metadata list to just the [accessions](../../assets/editingSraExplorerMetadataFileToJustHaveAccessions.gif)

## Flow chart for the RNA-seq workflow 

Today we are running a forked version of the [nf-core RNASeq nextflow workflow](https://github.com/TheJacksonLaboratory/nf-core-rnaseq).   Nextflow has a lot of nice features when you are running, these options for everything from generating timing of execution, traces, to creating a directed-acyclic-graph (DAG).  You can find the documentation [here](https://www.nextflow.io/docs/latest/tracing.html).   I would check it out and have some fun exploring these options.

For us, our 
[forked RNA-seq DAG] 
<img src="../../assets/flowchartNFCoreRNASeq.png" width="1000">

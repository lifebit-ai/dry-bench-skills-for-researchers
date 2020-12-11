## Todays data
[!https://zenodo.org/badge/DOI/10.5281/zenodo.4317260.svg]

Today - we used our SraExplorer to subset the data we were interested.  It is a short class, so we wanted a small dataset:

[Targeted human RNASequencing data](https://zenodo.org/record/4317260)

You will find 3 different data sets, which we will use to run the RNA-sequencing Nextflow workflow we forked from the community-based standard group [nf-core](https://nf-co.re/).

## SRA Explorer

1. First we searched with the terms **targeted[All Fields] AND ("Homo sapiens"[Organism] OR human[All Fields])** in [Sra-explorer](https://sra-explorer.info/#)

2. Then we selected a project and we searched with this term **PRJNA564604[All Fields]** also in [Sra-explorer](https://sra-explorer.info/#)

3. Then we selected all the samples, clicked on the **Full Metadata** tab and downloaded these files to our laptop and [uploaded them to Zenodo shown in the gif here](https://github.com/lifebit-ai/dry-bench-skills-for-researchers/blob/main/assets/selectClass5ProjectForRNASeqAnalysisSRAExplorer.gif)

## Selecting only the accessions

The metadata file was edited using emacs - an editor available on most systems, to limit the full metadata list to just the [accessions](https://github.com/lifebit-ai/dry-bench-skills-for-researchers/blob/main/assets/editingSraExplorerMetadataFileToJustHaveAccessions.gif)
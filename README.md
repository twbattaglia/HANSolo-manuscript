# HANSolo-manuscript
"Identification of patient-specific T cell neoantigens through HLA-agnostic genetic screens"


This is a repository of code for the analyses associated with the paper "Identification of patient-specific T cell neoantigens through HLA-agnostic genetic screens" by Cattaneo et al. (Submitted)


### Description
This repository contains analyses for the publication, Cattaneo et al. It contains a R Markdown document outlining the code and commands analysis that were involved in the manuscript after the sequencing data was processed. It does not contain the raw sequencing data, but this information can be found with the Data Availability section within the publication. 

### Data Processing
The raw sequencing data underwent a pre-processing step that removed low quality reads, extracted inline sequence barcodes and generated a count matrix after aligneing to the oligo library. This pipeline can be found here: https://github.com/twbattaglia/amplicon-nf and was created as a reproducible Nextflow pipeline that takes in the demultiplex FASTQ files for each sample and generates a combined count matrix that is the starting point for this repos's analysis. More infomation about how to run the pipeline can be found within the respective repo.







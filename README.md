# HANSolo-manuscript

This repository contains the code pertinent to our publication Nature Biotechnology. Please refer to materials and methods section of the article for details.

>Chiara M. Cattaneo, Thomas Battaglia, Jos Urbanus, Ziva Moravec, Rhianne Voogd, Rosa de Groot, Koen J. Hartemink, John B.A.G. Haanen, Emile E. Voest, Ton N. Schumacher, and Wouter Scheper, Identification of patient-specific CD4+ and CD8+ T cell neoantigens through HLA-unbiased genetic screens, _Nature Biotechnology_ (Accepted)

At this time the data objects (e.g .rda) are only available upon request.

## Description
This repository contains analyses for the publication, Cattaneo et al. It contains a R Markdown document outlining the code and commands analysis that were involved in the manuscript after the sequencing data was processed. It does not contain the raw sequencing data, but this information can be found with the Data Availability section within the publication. 

*The 3 markdown reports  refer to the code used to generate figures for the CD4 & CD8 benchmark as well as the ITO66 patient dropout screen.*

### Data Processing
The raw sequencing data underwent a pre-processing step that removed low quality reads, extracted inline sequence barcodes and generated a count matrix after aligneing to the oligo library. 

This pipeline can be found here: https://github.com/twbattaglia/amplicon-nf and was created as a reproducible Nextflow pipeline that takes in the demultiplex FASTQ files for each sample and generates a combined count matrix that is the starting point for this repos's analysis. More infomation about how to run the pipeline can be found within the respective repo.


### Reference
If you use this code, please cite the manuscript:

>Chiara M. Cattaneo, Thomas Battaglia, Jos Urbanus, Ziva Moravec, Rhianne Voogd, Rosa de Groot, Koen J. Hartemink, John B.A.G. Haanen, Emile E. Voest, Ton N. Schumacher, and Wouter Scheper, Identification of patient-specific CD4+ and CD8+ T cell neoantigens through HLA-unbiased genetic screens, _Nature Biotechnology_ (Accepted)





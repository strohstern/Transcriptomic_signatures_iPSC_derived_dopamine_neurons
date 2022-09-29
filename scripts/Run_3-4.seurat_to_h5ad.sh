#!/bin/sh

module purge
module load Anaconda3/2020.02
source activate scvelo-0.2.2

Rscript -e "rmarkdown::render('./R_scripts/3-3.RNA_velocity_integration_with_Seurat.Rmd')"

conda deactivate
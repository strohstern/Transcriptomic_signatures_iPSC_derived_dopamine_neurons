#!/bin/sh

module purge
module load CellRanger/3.0.2-bcl2fastq-2.20.0

sample_id=$1
organism=$2


if [ $organism == 'Homo_sapiens' ]
then    
    transcriptome="refdata-cellranger-GRCh38-3.0.0" 
else 
    echo The specified organism is not available.
fi

fastq_loc="`~/primary_data/"

instruction="cellranger count --id=$sample_id \
	--transcriptome=$transcriptome \
	--fastqs=$fastq_loc \
	--sample=$sample_id --project=SC20054"

echo $instruction

cellranger count --id=$sample_id \
	--transcriptome=$transcriptome \
	--fastqs=$fastq_loc \
	--sample=$sample_id --project=SC20054



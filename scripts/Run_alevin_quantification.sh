#!/bin/sh

module purge
module load Anaconda3/2020.02

source activate salmon

read1_info="$1"
read2_info="$2"
sample_name="$3"
organism="$4"

if [ $organism == 'Homo_sapiens' ]
then
    genome_index="Homo_sapiens.GRCh38.95.expanded"
    tgMap_loc="Homo_sapiens.GRCh38.95.annotation.expanded.tx2gene.tsv"
else 
    echo The specified organism is not available.
fi


alevin_out="./alevin_quantification/${sample_name}"

instruction="salmon alevin -l ISR -i $genome_index \
    -1 $read1_info \
    -2 $read2_info \
    -o $alevin_out \
    -p 32 \
    --tgMap $tgMap_loc \
    --chromiumV3 --dumpFeatures"

echo $instruction

salmon alevin -l ISR -i $genome_index \
    -1 $read1_info \
    -2 $read2_info \
    -o $alevin_out \
    -p 32 \
    --tgMap $tgMap_loc \
    --chromiumV3 --dumpFeatures
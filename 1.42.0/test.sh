#!/bin/bash

set -ev

if [ -d "nanotest" ]; then
    echo "nanotest already cloned"
else
    git clone https://github.com/wdecoster/nanotest.git
fi

./singularity-NanoPlot-1.42.0.sif -h
./singularity-NanoPlot-1.42.0.sif --listcolors
echo "testing figformat pdf with:"
./singularity-NanoPlot-1.42.0.sif --bam nanotest/alignment.bam --verbose -o tests -o tests --format pdf --drop_outliers
echo "testing fasta with --tsv_stats:"
./singularity-NanoPlot-1.42.0.sif --fasta nanotest/reads.fa.gz --verbose --maxlength 35000 -o tests --tsv_stats
echo "testing bam:"
./singularity-NanoPlot-1.42.0.sif --bam nanotest/alignment.bam --verbose -o tests --title testing
echo "testing bam without supplementary alignments:"
./singularity-NanoPlot-1.42.0.sif --bam nanotest/alignment.bam --verbose --no_supplementary -o tests
echo "testing summary:"
./singularity-NanoPlot-1.42.0.sif --summary nanotest/sequencing_summary.txt --loglength --verbose -o tests
echo "testing fastq rich:"
./singularity-NanoPlot-1.42.0.sif --fastq_rich nanotest/reads.fastq.gz --verbose --downsample 800 -o tests
echo "testing fastq minimal:"
./singularity-NanoPlot-1.42.0.sif --fastq_minimal nanotest/reads.fastq.gz --store --verbose --plots dot -o tests
echo "testing fastq plain:"
./singularity-NanoPlot-1.42.0.sif --fastq nanotest/reads.fastq.gz --verbose --minqual 4 --color red -o tests
echo "testing fasta:"
./singularity-NanoPlot-1.42.0.sif --fasta nanotest/reads.fa.gz --verbose --maxlength 35000 -o tests
echo "testing --no_static:"
./singularity-NanoPlot-1.42.0.sif --summary nanotest/sequencing_summary.txt  --verbose --maxlength 35000 -o tests --no_static

#!/bin/bash

set -ev

if [ -d "nanotest" ]; then
    echo "nanotest already cloned"
else
    git clone https://github.com/wdecoster/nanotest.git
fi

alias NanoPlot='./singularity-nanoplot-1.42.0.sif'

NanoPlot --listcolors
echo "testing figformat pdf with:"
NanoPlot --bam nanotest/alignment.bam --verbose -o tests -o tests --format pdf --drop_outliers
echo "testing fasta with --tsv_stats:"
NanoPlot --fasta nanotest/reads.fa.gz --verbose --maxlength 35000 -o tests --tsv_stats
echo "testing bam:"
NanoPlot --bam nanotest/alignment.bam --verbose -o tests --title testing
echo "testing bam without supplementary alignments:"
NanoPlot --bam nanotest/alignment.bam --verbose --no_supplementary -o tests
echo "testing summary:"
NanoPlot --summary nanotest/sequencing_summary.txt --loglength --verbose -o tests
echo "testing fastq rich:"
NanoPlot --fastq_rich nanotest/reads.fastq.gz --verbose --downsample 800 -o tests
echo "testing fastq minimal:"
NanoPlot --fastq_minimal nanotest/reads.fastq.gz --store --verbose --plots dot -o tests
echo "testing fastq plain:"
NanoPlot --fastq nanotest/reads.fastq.gz --verbose --minqual 4 --color red -o tests
echo "testing fasta:"
NanoPlot --fasta nanotest/reads.fa.gz --verbose --maxlength 35000 -o tests
echo "testing --no_static:"
NanoPlot --summary nanotest/sequencing_summary.txt  --verbose --maxlength 35000 -o tests --no_static

#!/bin/bash

set -xeu

mkdir -p data/tom2_40/gff &>/dev/null || true
mkdir -p data/tom2_40/vcf &>/dev/null || true
mkdir -p data/tom2_40/ref &>/dev/null || true
mkdir -p data/tom2_40/bam &>/dev/null || true



if [[ ! -f "data/tom2_40/bam/RF_001_SZAXPI008746-45.bam" ]]; then
wget -O data/tom2_40/bam/RF_001_SZAXPI008746-45.bam.tmp ftp://ftp.sra.ebi.ac.uk/vol1/ERA282/ERA282888/bam/RF_001_SZAXPI008746-45.bam && mv data/tom2_40/bam/RF_001_SZAXPI008746-45.bam.tmp data/tom2_40/bam/RF_001_SZAXPI008746-45.bam
fi

if [[ ! -f "data/tom2_40/bam/RF_001_SZAXPI008746-45.bam.bai" ]]; then
samtools index data/tom2_40/bam/RF_001_SZAXPI008746-45.bam
fi




if [[ ! -f "data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz" ]]; then
wget -O data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz.tmp ftp://ftp.sra.ebi.ac.uk/vol1/ERZ020/ERZ020447/RF_001_SZAXPI008746-45.vcf.gz && mv data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz.tmp data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz
fi

if [[ ! -f "data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz.tbi" ]]; then

gunzip -c data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz | bgzip -c > data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.tbz.tmp && mv data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.tbz.tmp data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.tbz

rm data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz

mv data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.tbz data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz

tabix data/tom2_40/vcf/RF_001_SZAXPI008746-45.vcf.gz
fi



if [[ ! -f "data/tom2_40/gff/ITAG2.3_assembly.gff3" ]]; then
wget -O data/tom2_40/gff/ITAG2.3_assembly.gff3.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/ITAG2.3_assembly.gff3 && mv data/tom2_40/gff/ITAG2.3_assembly.gff3.tmp data/tom2_40/gff/ITAG2.3_assembly.gff3
fi

if [[ ! -f "data/tom2_40/ref/S_lycopersicum_chromosomes.2.40.fa" ]]; then
wget -O - ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/assembly/build_2.40/S_lycopersicum_chromosomes.2.40.fa.gz | gunzip -c > data/tom2_40/ref/S_lycopersicum_chromosomes.2.40.fa.tmp && mv data/tom2_40/ref/S_lycopersicum_chromosomes.2.40.fa.tmp data/tom2_40/ref/S_lycopersicum_chromosomes.2.40.fa
fi


echo "#!/bin/bash"                            >  data/tom2_40.cfg
echo ""                                       >> data/tom2_40.cfg
echo "set -xeu"                               >> data/tom2_40.cfg
echo ""                                       >> data/tom2_40.cfg
echo "REF=S_lycopersicum_chromosomes.2.40.fa" >> data/tom2_40.cfg
echo "DB_NAME=tom2_40"                        >> data/tom2_40.cfg


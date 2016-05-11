#!/bin/bash

set -xeu

mkdir -p data/tom2_40/gff &>/dev/null || true
mkdir -p data/tom2_40/vcf &>/dev/null || true
mkdir -p data/tom2_40/ref &>/dev/null || true
mkdir -p data/tom2_40/bam &>/dev/null || true



FN=RF_001_SZAXPI008746-45.bam
if [[ ! -f "data/tom2_40/bam/RF_001_SZAXPI008746-45.bam" ]]; then
wget -O data/tom2_40/bam/${FN}.tmp ftp://ftp.sra.ebi.ac.uk/vol1/ERA282/ERA282888/bam/${FN} && mv data/tom2_40/bam/${FN}.tmp data/tom2_40/bam/${FN}
fi

if [[ ! -f "data/tom2_40/bam/${FN}.bai" ]]; then
samtools index data/tom2_40/bam/${FN}
fi



FN=RF_001_SZAXPI008746-45.vcf
FNZ=${FN}.gz
if [[ ! -f "data/tom2_40/vcf/${FNZ}" ]]; then
wget -O data/tom2_40/vcf/${FNZ}.tmp ftp://ftp.sra.ebi.ac.uk/vol1/ERZ020/ERZ020447/${FNZ} && mv data/tom2_40/vcf/${FNZ}.tmp data/tom2_40/vcf/${FNZ}
fi

if [[ ! -f "data/tom2_40/vcf/${FNZ}.tbi" ]]; then
FNT=${FN}.tbz
gunzip -c data/tom2_40/vcf/${FNZ} | bgzip -c > data/tom2_40/vcf/${FNT}.tmp && mv data/tom2_40/vcf/${FNT}.tmp data/tom2_40/vcf/${FNT}

rm data/tom2_40/vcf/${FNZ}

mv data/tom2_40/vcf/${FNT} data/tom2_40/vcf/${FNZ}

tabix data/tom2_40/vcf/${FNZ}
fi


FN=ITAG2.3_assembly.gff3
if [[ ! -f "data/tom2_40/gff/${FN}" ]]; then
wget -O data/tom2_40/gff/${FN}.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/${FN} && mv data/tom2_40/gff/${FN}.tmp data/tom2_40/gff/${FN}
fi

FN=ITAG2.3_sgn_data.gff3
if [[ ! -f "data/tom2_40/gff/${FN}" ]]; then
mkdir -p data/tom2_40/gff/ITAG/ &>/dev/null || true
wget -O data/tom2_40/gff/ITAG/${FN}.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/${FN} && \
mv data/tom2_40/gff/ITAG/${FN}.tmp data/tom2_40/gff/ITAG/${FN}
fi

FN=S_lycopersicum_chromosomes.2.40.fa
if [[ ! -f "data/tom2_40/ref/${FN}" ]]; then
wget -O - ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/assembly/build_2.40/${FN}.gz | gunzip -c > data/tom2_40/ref/${FN}.tmp && mv data/tom2_40/ref/${FN}.tmp data/tom2_40/ref/${FN}
fi


echo "#!/bin/bash"                            >  data/tom2_40.cfg
echo ""                                       >> data/tom2_40.cfg
echo "set -xeu"                               >> data/tom2_40.cfg
echo ""                                       >> data/tom2_40.cfg
echo "REF=S_lycopersicum_chromosomes.2.40.fa" >> data/tom2_40.cfg
echo "DB_NAME=tom2_40"                        >> data/tom2_40.cfg


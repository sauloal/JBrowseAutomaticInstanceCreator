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
OPATH=data/tom2_40/gff
mkdir -p ${OPATH} || true
if [[ ! -f "${OPATH}/${FN}" ]]; then
wget -O ${OPATH}/${FN}.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/${FN} && mv ${OPATH}/${FN}.tmp ${OPATH}/${FN}
fi

echo -e 'LBL="Assembly - All"' > ${OPATH}/${FN}.nfo

(TYPE=remark     ; TN="Remarks"      ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Assembly - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=supercontig; TN="Super Contig" ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Assembly - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=ultracontig; TN="Ultra Contigs"; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Assembly - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)





FN=ITAG2.3_gene_models.gff3
OPATH=data/tom2_40/gff/Gene_Models
mkdir -p ${OPATH} || true
if [[ ! -f "${OPATH}/${FN}" ]]; then
wget -O ${OPATH}/${FN}.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/${FN} && mv ${OPATH}/${FN}.tmp ${OPATH}/${FN}
fi

echo 'LBL="Gene Models - All"' > ${OPATH}/${FN}.nfo

(TYPE=gene           ; TN="Genes"  ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=mRNA           ; TN="mRNAs"  ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=exon           ; TN="Exons"  ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=CDS            ; TN="CDSs"   ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=intron         ; TN="Introns"; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=exon           ; TN="Exons"  ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=five_prime_UTR ; TN="5' UTR" ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)
(TYPE=three_prime_UTR; TN="3' UTR" ; cd ${OPATH} && (ln -s ${FN} ${FN}_${TYPE}.gff3 || true) && echo -e 'LBL="Gene Models - '${TN}'"\nGFF_TYPE="'${TYPE}'"' > ${FN}_${TYPE}.gff3.nfo)







FN=ITAG2.3_sgn_data.gff3
OPATH=data/tom2_40/gff/ITAG
mkdir -p ${OPATH} || true
if [[ ! -f "${OPATH}/${FN}" ]]; then
wget -O ${OPATH}/${FN}.tmp ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.3_release/${FN} && \
mv ${OPATH}/${FN}.tmp ${OPATH}/${FN}
fi
echo 'LBL="SGN Data"' > ${OPATH}/${FN}.nfo



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


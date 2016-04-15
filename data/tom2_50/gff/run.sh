wget --no-clobber ftp://ftp.solgenomics.net/genomes/Solanum_lycopersicum/annotation/ITAG2.4_release/*.gff3

ls *.gff3 | xargs -P 50 -n 1 -I {} bash -c "(grep ^\"#\" {}; grep -v ^\"#\" {} | sort -k1,1 -k4,4n) | bgzip > {}.sorted.gff3.gz.tmp && \
mv {}.sorted.gff3.gz.tmp {}.sorted.gff3.gz && \
tabix -p gff {}.sorted.gff3.gz"


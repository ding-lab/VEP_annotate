OUTD="/data/vep_annotate_direct"
mkdir -p $OUTD

REF="/ref/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"
VCF="/data/merged/filtered.vcf"
#VEP_GZ="/vep/v99/vep-cache.99_GRCh38.tar.gz"
VEP_DIR="/vep"  # this will run with VEP cache but without copying the data

VEP_VER="99"
ASSEMBLY="GRCh38"

#INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER --vep_cache_gz $VEP_GZ"
INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER --vep_cache_dir $VEP_DIR"

ARGS="--results_dir results --vep_opts \"--hgvs --shift_hgvs 1 --no_escape --symbol --numbers --ccds --uniprot --xref_refseq --sift b --tsl --canonical --total_length --allele_number --variant_class --biotype --appris --flag_pick_allele --check_existing --failed 1 --minimal --pick_order biotype,rank,canonical\""

#CMD="/usr/bin/perl /usr/local/TinDaisy-VEP/SomaticWrapper.pl $INPUTS $ARGS"
CMD="/usr/bin/perl ../..//SomaticWrapper.pl $INPUTS $ARGS"

>&2 echo Running $CMD
eval $CMD


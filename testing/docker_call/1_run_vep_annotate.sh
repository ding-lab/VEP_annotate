source ../../docker/docker_image.sh

# katmai
VEP_ROOT="/diskmnt/Datasets/VEP"
REF_ROOT="/diskmnt/Datasets/Reference"
DATA_ROOT="/home/mwyczalk_test/Projects/GermlineCaller/C3L-00001"

# MGI
#VEP_ROOT="/gscmnt/gc7202/dinglab/common/databases/VEP"
#REF_ROOT="/gscmnt/gc7202/dinglab/common/Reference/A_Reference"
#DATA_ROOT="/gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001"
#ARGS="-M MGI -P"

MOUNT="$VEP_ROOT:/vep"
MOUNT="$MOUNT $REF_ROOT:/ref"
MOUNT="$MOUNT $DATA_ROOT:/data"

OUTD="/data/vep_annotate_docker"
mkdir -p $OUTD

REF="/ref/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"
VCF="/data/merged/filtered.vcf"
VEP_GZ="/vep/v99/vep-cache.99_GRCh38.tar.gz"

VEP_VER="99"
ASSEMBLY="GRCh38"

#INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER --vep_cache_gz $VEP_GZ"
# no DB version below, so that ./vep-cache not created (use less disk space)
INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER"

ARGS="--results_dir results --vep_opts \"--hgvs --shift_hgvs 1 --no_escape --symbol --numbers --ccds --uniprot --xref_refseq --sift b --tsl --canonical --total_length --allele_number --variant_class --biotype --appris --flag_pick_allele --check_existing --failed 1 --minimal --pick_order biotype,rank,canonical\""

#CMD="/usr/bin/perl /usr/local/TinDaisy-VEP/SomaticWrapper.pl $INPUTS $ARGS"
CMD="/usr/bin/perl /usr/local/TinDaisy-VEP/SomaticWrapper.pl $INPUTS $ARGS"

ARGS="-M docker -l"
DCMD="../../docker/WUDocker/start_docker.sh $@ $ARGS -I $IMAGE -c \"$CMD\" $MOUNT"
>&2 echo Running: $DCMD
eval $DCMD



source ../../docker/docker_image.sh
IMAGE=$IMAGE_GATK

DATD="/home/mwyczalk_test/Projects/GermlineCaller/C3L-00001"
REFD="/diskmnt/Datasets/Reference"

REF="/Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"

PROCESS="/opt/MergeFilterVCF/src/merge_vcf.sh"

OUT="/data/docker_run_output/merged.vcf"

IND="/data/VLD_FilterVCF.out"
IN_VCF=" \
$IND/GATK.indel.VLD.vcf \
$IND/GATK.snp.VLD.vcf \
$IND/pindel.VLD.vcf \
$IND/varscan.indel.VLD.vcf \
$IND/varscan.snp.VLD.vcf "

CMD="bash $PROCESS $@ -o $OUT -R $REF $IN_VCF"

ARGS="-M docker -l"
DCMD="../../docker/WUDocker/start_docker.sh $@ $ARGS -I $IMAGE -c \"$CMD\" $DATD:/data $REFD:/Reference"
>&2 echo Running: $DCMD
eval $DCMD


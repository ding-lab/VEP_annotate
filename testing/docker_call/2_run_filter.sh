source ../../docker/docker_image.sh
IMAGE=$IMAGE_FILTER

DATD="/home/mwyczalk_test/Projects/GermlineCaller/C3L-00001"

INPUT="/data/docker_run_output/merged.vcf"
OUT="/data/docker_run_output/merged-filtered.vcf"

PROCESS="/opt/MergeFilterVCF/src/filter_vcf.sh"
EXCLUDE="-X varscan_indel,gatk_indel"

CMD="bash $PROCESS $@ -o $OUT $EXCLUDE $INPUT"

ARGS="-M docker -l"
DCMD="../../docker/WUDocker/start_docker.sh $@ $ARGS -I $IMAGE -c \"$CMD\" $DATD:/data"
>&2 echo Running: $DCMD
eval $DCMD


# start docker image with ../demo_data mapped to /data,
# unless another path is passed on command line.  uses
# the start_docker.sh script in /docker

source ../../docker/docker_image.sh

VEP_ROOT="/gscmnt/gc7202/dinglab/common/databases/VEP"
MOUNT="$VEP_ROOT:/vep"

REF_ROOT="/gscmnt/gc7202/dinglab/common/Reference/A_Reference"
MOUNT="$MOUNT $REF_ROOT:/ref"

DATA_ROOT="/gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001"
MOUNT="$MOUNT $DATA_ROOT:/data"

cd ../.. && bash docker/WUDocker/start_docker.sh -M MGI -P $@ -I $IMAGE $MOUNT


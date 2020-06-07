# start docker image with ../demo_data mapped to /data,
# unless another path is passed on command line.  uses
# the start_docker.sh script in /docker

DATAD="/home/mwyczalk_test/Projects/GermlineCaller/C3L-00001"
REFD="/diskmnt/Datasets/Reference"
source ../../docker/docker_image.sh
IMAGE=$IMAGE_GATK

cd ../.. && bash docker/WUDocker/start_docker.sh $@ -I $IMAGE $DATAD:/data $REFD:/Reference



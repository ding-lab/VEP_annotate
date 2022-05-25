DOCKER_SYSTEM="docker"

# Note, we will want to put cache files in /data/v99
DATA_DIR="/diskmnt/Projects/cptac/database/VEP"
source ../docker/docker_image.sh

CACHE_VERSION="99"
IMAGE=$IMAGE_V99
CACHED="$DATA_DIR/v${CACHE_VERSION}"
mkdir -p $CACHED


# Where VEP is installed in docker image
VEPD="/usr/local/ensembl-vep"
# https://useast.ensembl.org/info/docs/tools/vep/script/vep_download.html#installer
CMD="perl $VEPD/INSTALL.pl -n -a cf -s homo_sapiens -y GRCh38 --CACHEDIR $CACHED --CACHE_VERSION $CACHE_VERSION"

>&2 echo Launching $IMAGE on $DOCKER_SYSTEM
DOCKER_CMD="bash ../docker/WUDocker/start_docker.sh -I $IMAGE -M $DOCKER_SYSTEM -c \"$CMD\" $DATA_DIR"
>&2 echo Running: $DOCKER_CMD
eval $DOCKER_CMD


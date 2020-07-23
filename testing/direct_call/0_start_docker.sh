# start docker image with ../demo_data mapped to /data,
# unless another path is passed on command line.  uses
# the start_docker.sh script in /docker

source ../../docker/docker_image.sh

# katmai
VEP_ROOT="/diskmnt/Datasets/VEP"
REF_ROOT="/diskmnt/Datasets/Reference"
DATA_ROOT="/home/mwyczalk_test/Projects/TinDaisy/testing/C3L-00908-data/dat"
CLINVAR_ROOT="/diskmnt/Datasets/ClinVar"

# MGI
# Mounting cromwell-executions
#CE_ROOT="/gscmnt/gc2541/cptac3_analysis/cromwell-workdir/cromwell-executions"
#MOUNT="$CE_ROOT:/cromwell-executions"

#VEP_ROOT="/gscmnt/gc7202/dinglab/common/databases/VEP"
#REF_ROOT="/gscmnt/gc7202/dinglab/common/Reference/A_Reference"
#DATA_ROOT="/gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001"
#ARGS="-M MGI -P"

MOUNT="$VEP_ROOT:/vep"
MOUNT="$MOUNT $REF_ROOT:/ref"
MOUNT="$MOUNT $DATA_ROOT:/data"
MOUNT="$MOUNT $CLINVAR_ROOT:/clinvar"

cd ../.. && bash docker/WUDocker/start_docker.sh $ARGS $@ -I $IMAGE $MOUNT


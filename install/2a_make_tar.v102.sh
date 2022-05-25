# We compress the VEP cache so it can be passed to our pipeline as a file
CACHE_VERSION="v102"

CACHED="/diskmnt/Projects/cptac/database/VEP/$CACHE_VERSION"

# VR (= version _ reference) is from VEP, e.g.,
#   /data/v99/homo_sapiens/99_GRCh38/
VR="102_GRCh38"
OUT="vep-cache.$VR.tar.gz"
LOG="$VR.log"

cd $CACHED
CMD="tar -zvcf $OUT homo_sapiens/$VR &> $LOG"

>&2 echo Running $CMD
>&2 echo in directory $CACHED

eval $CMD

>&2 echo Complete
>&2 echo Log files: $LOG
>&2 echo VEP_CACHE_GZ = $OUT




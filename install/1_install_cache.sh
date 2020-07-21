#CACHE_VERSION="v99"
CACHE_VERSION="95"

CACHED="/data/v${CACHE_VERSION}"
mkdir -p $CACHED

# Where VEP is installed in docker image
VEPD="/usr/local/ensembl-vep"

# https://useast.ensembl.org/info/docs/tools/vep/script/vep_download.html#installer
CMD="perl $VEPD/INSTALL.pl -a cf -s homo_sapiens -y GRCh38 --CACHEDIR $CACHED --CACHE_VERSION $CACHE_VERSION"

>&2 echo Running: $CMD
eval $CMD



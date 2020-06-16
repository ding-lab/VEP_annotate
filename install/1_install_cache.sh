CACHE_VERSION="v99"

CACHED="/data/$CACHE_VERSION"
mkdir -p $CACHED

# Where VEP is installed in docker image
VEPD="/usr/local/ensembl-vep"

# https://useast.ensembl.org/info/docs/tools/vep/script/vep_download.html#installer
perl $VEPD/INSTALL.pl -a cf -s homo_sapiens -y GRCh38 --CACHEDIR $CACHED --CACHE_VERSION $CACHE_VERSION


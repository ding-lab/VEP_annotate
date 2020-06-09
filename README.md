# VEP Annotate

VEP annotator based on TinDaisy-Core
This supercedes TinDaisy-Core VEP annotation

IMAGE="mwyczalkowski/tindaisy-vep"

VEP Cache logic:
* If cache_dir is defined, it indicates location of VEP cache 
  - this is not an option in CWL, since directories are not staged
* if cache_dir is not defined, and cache_gz is defined, extract cache_gz contents into "./vep-cache" and use VEP cache
* if neither cache_dir nor cache_gz defined, will perform online VEP DB lookups
Online VEP database lookups a) uses online database (so cache isn't installed) b) does not use tmp files
It is meant to be used for testing and lightweight applications.  Use the cache for better performance.
See discussion: https://www.ensembl.org/info/docs/tools/vep/script/vep_cache.html 


Required VEP args for GRCh37
"--port 3337"

## Authors

* Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
* Song Cao <scao@wustl.edu>
* Jay Mashl <rmashl@wustl.edu>

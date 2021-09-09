# VEP Annotate

VEP annotator based on TinDaisy-Core and GenomeVIP

IMAGE="mwyczalkowski/vep-annotate:20200608"

## VEP Cache 

This tool allows the use of either a VEP cache or online VEP database lookups, and allows the 
"staging" of a compressed version of the VEP cache for cromwell applications. 

It is [recommended to use a VEP cache in production runs for better performance](https://www.ensembl.org/info/docs/tools/vep/script/vep_cache.html).
However, online VEP lookups allow for VEP annotation without having to install a large VEP cache file.  Which mode
is used depends on how VEP annotation is invoked and the arguments passed.

When `src/vep_annotate.sh` is invoked, it accepts arguments `cache_dir` and `cache_gz`.

* If cache_dir is defined, it indicates location of VEP cache 
  * this will provide fastest execution because cache is available and does not need to be staged
* if cache_dir is not defined, and cache_gz is defined, the contents of `cache_gz` will be staged
  * Staging will extract cache_gz contents into "./vep-cache" and use VEP cache
  * this is required for cromwell runs which do not stage directories
* if neither cache_dir nor cache_gz are defined, perform online VEP DB lookups
  * Online VEP database lookups a) uses online database (so cache isn't installed) b) does not use tmp files
    It is meant to be used for testing and lightweight applications.  

For CWL invocation `cache_dir` is not a supported option, because Cromwell does not copy directories; this may
change in the future or for different CWL engines.  For VEP cache to be used (highly recommended), the 
contents of the VEP cache, created with `tar -zcf`, must be provided.

### Creating VEP Cache

VEP Cache creation is described in install/README.md

## VEP arguments 

Arbitrary arguments may be passed to VEP with `--vep_opts` argument to `src/vep_annotate.sh`.  

VEP arguments will in general differ for different pipelines, with TinDaisy and TinJasmine using different values.
At this time, `--vep_opts` is hard-coded in the CWL, requiring different CWL for the two pipelines.  Future development
may make this more general.

Note also that to use GRCh37, the following additional VEP argument is required: `--port 3337`

The VEP argument `--flag_pick` is always added to VEP invocation.

## Custom annotation

Support for [VEP custom annotation](http://useast.ensembl.org/info/docs/tools/vep/script/vep_custom.html)
is provided with the following two arguments:
```
--custom_filename s: Path to VEP custom annotation file.  
--custom_args s: Arguments passed to VEP custom annotation.  Required if --custom_filename defined.  
```
Example of `custom_args`: `ClinVar,vcf,exact,0,CLNSIG,CLNREVSTAT,CLNDN`

ClinVar VEP custom annotation file can be obtained here: ftp://ftp.ncbi.nlm.nih.gov/pub/clinvar/vcf_GRCh38/
Note that the associated index `.tbi` file must also be provided

Custom annotation is required for identifying ClinVar variants.

## Authors

* Matthew Wyczalkowski <m.wyczalkowski@wustl.edu>
* Song Cao <scao@wustl.edu>
* Jay Mashl <rmashl@wustl.edu>

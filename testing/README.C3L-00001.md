Using C3L-00001 VCF as annotation source for testing development

# Testing details - C3L-00001

## Project data
Obtained from recent TinDaisy run,
    ~/projects/CromwellRunner/TinDaisy/8_CCRCC.HotspotProximity16.20200521

vep_cache_gz:           /gscmnt/gc7202/dinglab/common/databases/VEP/v99/vep-cache.99_GRCh38.tar.gz
vep_cache_version:      99
assembly:               GRCh38
reference_fasta:        /gscmnt/gc7202/dinglab/common/Reference/A_Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa

## Case data

Taken from ongoing testing of C3L-00001 data, this is output from merge / filter step

input_vcf:  /gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001/merged/filtered.vcf

## Docker volumes

Paths are split as,
```
VEP_ROOT="/gscmnt/gc7202/dinglab/common/databases/VEP"
VEP_CACHE_GZ="$VEP_ROOT/v99/vep-cache.99_GRCh38.tar.gz"

REF_ROOT="/gscmnt/gc7202/dinglab/common/Reference/A_Reference"
REF_FASTA="$REF_ROOT/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"

DATA_ROOT="/gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001"
VCF="$DATA_ROOT/merged/filtered.vcf"
```

ROOT paths are volumes in Docker as /vep, /ref, and /data, respectively


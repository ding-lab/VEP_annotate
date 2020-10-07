Using C3L-00001 VCF as annotation source for testing development

# Testing details - C3L-00001

## MGI

### Project data
Obtained from recent TinDaisy run,
    ~/projects/CromwellRunner/TinDaisy/8_CCRCC.HotspotProximity16.20200521

vep_cache_gz:           /gscmnt/gc7202/dinglab/common/databases/VEP/v99/vep-cache.99_GRCh38.tar.gz
vep_cache_version:      99
assembly:               GRCh38
reference_fasta:        /gscmnt/gc7202/dinglab/common/Reference/A_Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa
custom_filename         /gscmnt/gc7202/dinglab/common/databases/ClinVar/GRCh38/20200706/clinvar_20200706.vcf.gz

### Case data

Taken from ongoing testing of C3L-00001 data, this is output from merge / filter step

input_vcf:  /gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001/merged/filtered.vcf

### Docker volumes

Paths are split as,
```
VEP_ROOT="/gscmnt/gc7202/dinglab/common/databases/VEP"
VEP_CACHE_GZ="$VEP_ROOT/v99/vep-cache.99_GRCh38.tar.gz"

REF_ROOT="/gscmnt/gc7202/dinglab/common/Reference/A_Reference"
REF_FASTA="$REF_ROOT/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"

DATA_ROOT="/gscmnt/gc2508/dinglab/mwyczalk/GermlineCaller.Testing/C3L-00001"
VCF="$DATA_ROOT/merged/filtered.vcf"

CLINVAR_ROOT="/gscmnt/gc7202/dinglab/common/databases/ClinVar"
CUSTOM_FILENAME="$CLINVAR_ROOT/GRCh38/20200706/clinvar_20200706.vcf.gz"
```

ROOT paths are volumes in Docker as /vep, /ref, and /data, respectively

## Katmai

VEP_ROOT="/diskmnt/Datasets/VEP"
REF_ROOT="/diskmnt/Datasets/Reference"
DATA_ROOT="/home/mwyczalk_test/Projects/GermlineCaller/C3L-00001"
CLINVAR_ROOT="/diskmnt/Datasets/ClinVar"

# Testing details C3L-00908

Somatic testing can take place with C3L-00908 data, a CCRCC test run which took
place on MGI for CromwellRunner batch CCRCC.HotspotProximity16.20200521.  

See MGI:/gscuser/mwyczalk/projects/TinDaisy/testing/dbSnP-filter-dev/VEP_annotate.testing.C3L-00908/testing/README.data.md
for details about this dataset

It has been copied to katmai here:/home/mwyczalk_test/Projects/TinDaisy/testing/C3L-00908-data/dat

## MNP Filter output

Input into VEP_annotate in TinDaisy2 the output of mnp_filter

/gscmnt/gc2541/cptac3_analysis/cromwell-workdir/cromwell-executions/tindaisy-hotspot.cwl/47c63123-dab6-417b-a431-c9aa9589e6e4/results/call-mnp_filter/execution/MNP_combined.vcf


## ad hoc testing notes:

Test of cwl_call-MGI/1_run_vep_annotate.sh with ClinVar annotation (10/7/20)
with custom annotation believed to be appropriate for ClinVar rescue downstream
    vep_annotate.TinDaisy.cwl commit 7cebc23b9

/gscmnt/gc2541/cptac3_analysis/cromwell-workdir/cromwell-executions/vep_annotate.TinDaisy.cwl/62de35d0-29ad-4659-a896-4862e8375ef5/call-vep_annotate.TinDaisy.cwl

Result VCF:
/gscmnt/gc2541/cptac3_analysis/cromwell-workdir/cromwell-executions/vep_annotate.TinDaisy.cwl/62de35d0-29ad-4659-a896-4862e8375ef5/call-vep_annotate.TinDaisy.cwl/execution/results/vep/output_vep.vcf


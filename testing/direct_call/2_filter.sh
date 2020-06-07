OUTD="/data/merge_results_direct"
mkdir -p $OUTD

#Usage:
#  bash filter_vcf.sh [options] input.vcf
#
#Options:
#-h: Print this help message
#-d: Dry run - output commands but do not execute them
#-v: print filter debug information
#-o OUT_VCF : Output VCF filename.  Default: write to stdout
#-B: bypass this filter, i.e., do not remove any calls
#-I include_list: Retain only calls with given caller(s); comma-separated list
#-X exclude_list: Exclude all calls with given caller(s); comma-separated list
#-R: remove filtered variants.  Default is to retain filtered variants with filter name in VCF FILTER field

INPUT="$OUTD/merged.vcf"

OUT="$OUTD/merged-filtered.vcf"

#   4511 gatk_indel
#    740 gatk_indel-pindel
#   3758 gatk_indel-varscan_indel
#   2975 gatk_indel-varscan_indel-pindel
#  30594 gatk_snv
#  91226 gatk_snv-varscan_snv
#    750 pindel
#    354 varscan_indel
#     72 varscan_indel-pindel
#   6438 varscan_snv

EXCLUDE="-X varscan_indel,gatk_indel,varscan_snv,gatk_snv"

CMD="bash ../../src/filter_vcf.sh $@ -o $OUT $EXCLUDE $INPUT"

>&2 echo Running $CMD
eval $CMD


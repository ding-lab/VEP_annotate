OUTD="/data/merge_results_direct"
mkdir -p $OUTD

# /diskmnt/Datasets/Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa
REF="/Reference/GRCh38.d1.vd1/GRCh38.d1.vd1.fa"

IND="/data/VLD_FilterVCF.out"
IN_VCF=" \
$IND/GATK.indel.VLD.vcf \
$IND/GATK.snp.VLD.vcf \
$IND/pindel.VLD.vcf \
$IND/varscan.indel.VLD.vcf \
$IND/varscan.snp.VLD.vcf "

OUT="$OUTD/merged.vcf"

# Usage: merge_vcf.sh [options] GATK_indel GATK_snv pindel_indel varscan_indel varscan_snv
CMD="bash ../../src/merge_vcf.sh $@ -o $OUT -R $REF $IN_VCF"

>&2 echo Running $CMD
eval $CMD


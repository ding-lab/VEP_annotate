
OUTD="./output"
mkdir -p $OUTD

VCF="/cromwell-executions/TinJasmine-postcall.cwl/36ae3517-77b2-4a69-80fd-68908bfd7c54/call-roi_filter/execution/output/HotspotFiltered.vcf"
VEP_DIR="/cromwell-executions/TinJasmine-postcall.cwl/36ae3517-77b2-4a69-80fd-68908bfd7c54/call-vep_annotate/execution/vep-cache"
REF="/cromwell-executions/TinJasmine-postcall.cwl/36ae3517-77b2-4a69-80fd-68908bfd7c54/call-vep_annotate/inputs/-365693757/GRCh38.d1.vd1.fa"

VEP_VER="99"
ASSEMBLY="GRCh38"

#INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER --vep_cache_gz $VEP_GZ"
INPUTS="--input_vcf $VCF --reference_fasta $REF --assembly $ASSEMBLY --vep_cache_version $VEP_VER --vep_cache_dir $VEP_DIR"

#TinDaisy VEP args:
#--hgvs --shift_hgvs 1 --no_escape --symbol --numbers --ccds --uniprot --xref_refseq --sift b --tsl --canonical --total_length --allele_number --variant_class --biotype --appris --flag_pick_allele --check_existing --failed 1 --minimal --pick_order biotype,rank,canonical

# Don't expect to use TinDaisy args below, but keeping them around for sake of reproducing results
ARGS_TINDAISY="--af --max_af --af_1kg --af_esp --af_gnomad"
VEP_ARGS="--failed 0 --everything --af_exac $ARGS_TINDAISY --buffer_size 10000  --fork 4"


ARGS="--results_dir results --vep_opts \"$VEP_ARGS\""

#CMD="/usr/bin/perl /usr/local/TinDaisy-VEP/SomaticWrapper.pl $INPUTS $ARGS"
CMD="/usr/bin/perl ../..//SomaticWrapper.pl $INPUTS $ARGS"

>&2 echo Running $CMD
eval $CMD


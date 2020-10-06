Note that CWL for TinDaisy and TinJasmine differs, with different VEP arguments

TinJasmine VEP arguments
    --buffer_size 500  --fork 4 --failed 0 --everything --af_exac

TinDaisy VEP arguments
      --hgvs --shift_hgvs 1 --no_escape --symbol --numbers --ccds --uniprot
      --xref_refseq --sift b --tsl --canonical --total_length --allele_number
      --variant_class --biotype --appris --flag_pick_allele --check_existing
      --failed 1 --minimal --pick_order biotype,rank,canonical --af --max_af
      --af_1kg --af_esp --af_gnomad --buffer_size 500  --fork 4 

In vep_annotate.TinDaisy.cwl and vep_annotate.TinJasmine.cwl the parameters are passed as CWL
arguments, i.e., user does not choose them

In vep_annotate.cwl vep_opts is a CWL input.  The plan is that the appropriate values are
default arguments in TinDaisy, TinJasmine workflows - user doesn't define them, but they are
properties of the workflow

Note that TinJasmine workflow will need to be updated to either run the TinJasmine CWL or
have default values added

For custom annotation, required for ClinVar rescue, using custom arguments from 
    testing/direct_call/2_vep_annotate_cache.TinDaisy.sh
These are defined as arguments in vep_annotate.TinDaisy.cwl


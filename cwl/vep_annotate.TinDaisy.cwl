class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: vep_annotate.TinDaisy
baseCommand:
  - /usr/bin/perl
  - /usr/local/TinDaisy-VEP/src/SomaticWrapper.pl
inputs:
  - id: input_vcf
    type: File
    inputBinding:
      position: 0
      prefix: '--input_vcf'
  - id: reference_fasta
    type: File
    inputBinding:
      position: 0
      prefix: '--reference_fasta'
    secondaryFiles:
      - .fai
      - ^.dict
  - id: assembly
    type: string?
    inputBinding:
      position: 0
      prefix: '--assembly'
    label: assembly name for VEP annotation
    doc: Either GRCh37 or GRCh38 currently accepted
  - id: vep_cache_version
    type: string?
    inputBinding:
      position: 0
      prefix: '--vep_cache_version'
    label: 'VEP Cache Version (e.g., 93)'
  - id: vep_cache_gz
    type: File?
    inputBinding:
      position: 0
      prefix: '--vep_cache_gz'
    label: VEP Cache .tar.gz file
    doc: >-
      if defined, extract contents into "./vep-cache" and use VEP cache. 
      Otherwise, perform (much slower) online VEP DB lookups
  - id: custom_filename
    type: File?
    inputBinding:
      position: 0
      prefix: '--custom_filename'
    doc: Path to VEP custom annotation file
    secondaryFiles:
      - .tbi
  - id: custom_args
    type: string?
    inputBinding:
      position: 0
      prefix: '--custom_args'
    doc: >-
      Arguments passed to VEP custom annotation.  Required if custom_filename
      defined
outputs:
  - id: output_dat
    type: File
    outputBinding:
      glob: results/vep/output_vep.vcf
label: vep_annotate TinDaisy
arguments:
  - position: 0
    prefix: '--results_dir'
    valueFrom: results
  - position: 0
    prefix: '--vep_opts'
    valueFrom: >-
      --hgvs --shift_hgvs 1 --no_escape --symbol --numbers --ccds --uniprot
      --xref_refseq --sift b --tsl --canonical --total_length --allele_number
      --variant_class --biotype --appris --flag_pick_allele --check_existing
      --failed 1 --minimal --pick_order biotype,rank,canonical --af --max_af
      --af_1kg --af_esp --af_gnomad --buffer_size 500  --fork 4 
requirements:
  - class: ResourceRequirement
    ramMin: 8000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/vep-annotate:20200722'
  - class: InlineJavascriptRequirement

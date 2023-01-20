class: CommandLineTool
cwlVersion: v1.0
$namespaces:
  sbg: 'https://www.sevenbridges.com/'
id: vep_annotate_tin_jasmine_v102
baseCommand:
  - /usr/bin/perl
  - /usr/local/VEP_annotate/src/SomaticWrapper.pl
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
label: vep_annotate TinJasmine v102
arguments:
  - position: 0
    prefix: '--results_dir'
    valueFrom: results
  - position: 0
    prefix: '--vep_opts'
    valueFrom: '--buffer_size 50  --fork 4 --failed 0 --everything --af_exac'
  - position: 0
    prefix: '--vep_cache_version'
    valueFrom: '102'
  - position: 0
    prefix: '--assembly'
    valueFrom: GRCh38
requirements:
  - class: ResourceRequirement
    ramMin: 8000
  - class: DockerRequirement
    dockerPull: 'mwyczalkowski/vep-annotate:20220527-v102'
  - class: InlineJavascriptRequirement

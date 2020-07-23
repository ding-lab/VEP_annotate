######### Song Cao and Matt Wyczalkowski ###########
## pipeline for somatic variant calling ##

#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long qw(GetOptions);
use File::Basename;

require("vep_annotate.pl");

(my $usage = <<OUT) =~ s/\t+//g;
Usage: perl $0 [options] 

VEP annotation on a given VCF file

--results_dir s: Per-sample analysis results location. Often same as sample name [.] 
--input_vcf s: VCF file to be annotated with vep_annotate.  Required
--reference_fasta s: path to reference.  Required
--assembly s: either "GRCh37" or "GRCh38", used to identify cache file. Optional if not ambigous 
--vep_cache_version s: Cache version, e.g. '90', used to identify cache file.  Optional if not ambiguous
--vep_cache_gz: is a file ending in .tar.gz containing VEP cache tarball
--vep_opts s: string with additional arguments to vep_annotate tool.
--vep_cache_dir s: location of VEP cache directory
    VEP Cache logic:
    * If vep_cache_dir is defined, it indicates location of VEP cache 
    * if vep_cache_dir is not defined, and vep_cache_gz is defined, extract vep_cache_gz contents into "./vep-cache" and use VEP cache
    * if neither vep_cache_dir nor vep_cache_gz defined, will perform online VEP DB lookups
    NOTE: Online VEP database lookups a) uses online database (so cache isn't installed) b) does not use tmp files
      It is meant to be used for testing and lightweight applications.  Use the cache for better performance.
      See discussion: https://www.ensembl.org/info/docs/tools/vep/script/vep_cache.html 
--custom_filename s: Path to VEP custom annotation file.  See http://useast.ensembl.org/info/docs/tools/vep/script/vep_custom.html
--custom_args s: Arguments passed to VEP custom annotation.  Required if --custom_filename defined.  Example:
    "ClinVar,vcf,exact,0,CLNSIG,CLNREVSTAT,CLNDN"
OUT

my $results_dir = ".";  
my $input_vcf;
my $reference_fasta;
my $vep_cache_version;
my $vep_cache_dir;
my $vep_cache_gz;
my $vep_opts;
my $assembly;

GetOptions(
    'results_dir=s' => \$results_dir,
    'input_vcf=s' => \$input_vcf,
    'reference_fasta=s' => \$reference_fasta,
    'assembly=s' => \$assembly,
    'vep_cache_version=s' => \$vep_cache_version,
    'vep_cache_dir=s' => \$vep_cache_dir,
    'vep_cache_gz=s' => \$vep_cache_gz,
    'vep_opts=s' => \$vep_opts,
    'custom_filename=s' => \$custom_filename,
    'custom_args=s' => \$custom_args,
) or die "Error parsing command line args.\n$usage\n";

# automatically generated scripts in runtime
my $job_files_dir="$results_dir/runtime";  # OUTPUT PORT
system("mkdir -p $job_files_dir");

die("input_vcf undefined \n") unless $input_vcf;
die("reference_fasta undefined \n") unless $reference_fasta;
my $preserve_cache_gz = 0;  # get rid of uncompressed cache directory if expanded from .tar.gz
vep_annotate($results_dir, $job_files_dir, $reference_fasta, $assembly, $vep_cache_version, $vep_cache_dir, $vep_cache_gz, $preserve_cache_gz, $input_vcf, $vep_opts,
    $custom_filename, $custom_args);

Build docker image needed to run SomaticWrapper.pl vep annotation

Three versions of VEP currently supported:
* VEP v99 / gencode v33
* VEP v100 / gencode v34
* VEP v102 / gencode v36

Subsequently, downloaded the following
* VEP v95
* VEP v109 (latest as of May 2023)

[TinDaisy](https://github.com/ding-lab/TinDaisy) is an associated CWL-based workflow wrapper
which includes TinDaisy-Core


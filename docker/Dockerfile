FROM ubuntu:xenial

LABEL author="Matt Wyczalkowski" \
      maintainer="m.wyczalkowski@wustl.edu"

# Dockerfile with just the things we need to install VEP
# See https://useast.ensembl.org/info/docs/tools/vep/script/vep_download.html

RUN apt-get update && apt-get install -y \
    build-essential \
    cpanminus \
    curl \
    git \
    libbz2-dev \ 
    liblzma-dev \
    unzip \
    vim \
    wget \
    && apt-get clean

# DEVELOPMENT 
# Install mysql so that can use db-based VEP annotation 
# NOTE: this can be removed if using VEP cache on e.g. production servers
# based on
# https://stackoverflow.com/questions/38356219/mysql-in-docker-frozen-at-root-password-config
#    && apt-get install -y mysql-server libmysqlclient-dev libnss-sss \
RUN apt-get update \
    && { \
        echo debconf debconf/frontend select Noninteractive; \
        echo mysql-community-server mysql-community-server/data-dir select ''; \
        echo mysql-community-server mysql-community-server/root-pass password ''; \
        echo mysql-community-server mysql-community-server/re-root-pass password ''; \
        echo mysql-community-server mysql-community-server/remove-test-db select true; \
    } | debconf-set-selections \
    && apt-get install -y mysql-server libmysqlclient-dev \
    && apt-get clean
RUN cpanm Archive::Zip DBD::mysql DBI


# install VEP - we do not install cache into the image, it will be downloaded during setup
# See here for discussion of caches: https://www.ensembl.org/info/docs/tools/vep/script/vep_cache.html
# Cache dir will be /data/D_Ensembl

RUN cd /usr/local \
    && git clone https://github.com/Ensembl/ensembl-vep.git  \
    && cd /usr/local/ensembl-vep \
    && perl INSTALL.pl /data/D_Ensembl -a a

COPY docker/vimrc /root/.vimrc

COPY . /usr/local/TinDaisy-VEP
WORKDIR /usr/local/TinDaisy-VEP

ENV PERL5LIB=/usr/local/TinDaisy-VEP
ENV LC_ALL="C"

CMD ["/bin/bash"]

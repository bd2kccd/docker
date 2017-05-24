FROM jupyter/scipy-notebook

MAINTAINER "Chirayu Kong Wongchokprasitti" chw20@pitt.edu

USER root

# R pre-requisites
RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y \
    fonts-dejavu \
    gfortran \
    r-cran-rjava \
    graphviz \
    gcc && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER jovyan

# R packages including IRKernel which gets installed globally.
RUN conda config --system --add channels r && \
    conda install --quiet --yes \
    'rpy2=2.8*' \
    'r-base=3.3.2' \
    'r-irkernel=0.7*' \
    'r-plyr=1.8*' \
    'r-devtools=1.12*' \
    'r-tidyverse=1.0*' \
    'r-shiny=0.14*' \
    'r-rmarkdown=1.2*' \
    'r-forecast=7.3*' \
    'r-rsqlite=1.1*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=0.2*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-crayon=1.3*' \
    'r-rjava=0.9*' \
    'r-randomforest=4.6*' && conda clean -tipsy

USER root

RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get install -y -t jessie-backports \
    openjdk-8-jdk && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --set java "${JAVA_HOME}/bin/java"

ADD install.R /tmp/

RUN R CMD javareconf && R -f /tmp/install.R


USER jovyan

RUN source activate python2 && \
    conda config --system --add channels anaconda && \
    conda install --quiet --yes \
    'javabridge=1.0*' \
    'pydot=1.0*' \
    'graphviz=2.38*' && conda clean -tipsy

RUN source activate python2 && \
    git clone https://github.com/bd2kccd/py-causal /tmp/py-causal && \
    cd /tmp/py-causal && \
    python setup.py install



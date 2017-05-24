FROM jupyter/scipy-notebook

MAINTAINER "Chirayu Kong Wongchokprasitti" chw20@pitt.edu

USER root

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get install -y \
    graphviz && \
    apt-get autoclean && apt-get --purge -y autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

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

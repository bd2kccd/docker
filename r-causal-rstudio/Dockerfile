FROM rocker/rstudio:latest

MAINTAINER "Chirayu Kong Wongchokprasitti" chw20@pitt.edu

RUN echo 'deb http://ftp.debian.org/debian/ stable main contrib non-free' >> /etc/apt/sources.list

RUN apt-get -y update && \
    apt-get install -y \
        openjdk-7-jdk \
        r-cran-rjava && \
    R CMD javareconf

ADD install.R /tmp/

RUN R -f /tmp/install.R

## Expose a default volume for Kitematic
VOLUME /home/rstudio

CMD ["/init"]
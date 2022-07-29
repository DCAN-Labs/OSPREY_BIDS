#The base image is the AMD64 version of centos:centos7.9.2009, which
#should correspond to the OS at MSI
#FROM amd64/centos:7.9.2009
FROM ubuntu:latest 

# Prepare environment
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
                    apt-utils \
                    autoconf \
                    build-essential \
                    bzip2 \
                    ca-certificates \
                    curl \
                    gcc \
                    git \
                    gnupg \
                    libtool \
                    lsb-release \
                    pkg-config \
                    unzip \
                    wget \
                    xvfb \
                    zlib1g \
                    pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/

RUN pip install numpy

#Setup MCR - this grabs v910 of MCR that was downloaded from the matlab
#website, installed at MSI, and then zipped. If you want to use a
#different version of matlab then download the corresponding version
#of MCR, install it, zip it, and upload the new path to a public bucket
#on S3
RUN mkdir /mcr_path
RUN wget https://s3.msi.umn.edu/leex6144-public/v910.zip -O /mcr_path/mcr.zip
RUN cd /mcr_path && unzip -q ./mcr.zip
RUN rm /mcr_path/mcr.zip 

#Download the unique code for this project
RUN mkdir /code
RUN wget https://s3.msi.umn.edu/leex6144-public/osprey_containerization_code_v3.zip -O /code/code.zip
RUN cd /code && unzip -q ./code.zip
RUN rm /code/code.zip

#Export paths
ENV MCR_PATH=/mcr_path
ENV EXECUTABLE_PATH=/code/run_compiled.sh

RUN chmod 555 -R /mcr_path /code

ENTRYPOINT ["/code/run.py"]

# ===============================================================================
# Dockerfile
#   Builds FreakChain and the executable binary, "FreakChaind"
#
#
# It is based on Ubuntu 16.04 LTS
# ===============================================================================

# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER freak

# ===============================================================================
# Env. Setup
#

# Update repository
RUN apt-get update && apt-get -y upgrade

# ----------------------------------------------------------
# Dependencies
# ----------------------------------------------------------

# Basic Dependencies
#
RUN apt-get install -y git \
            ntp \
            unzip \
            build-essential \
            libssl-dev \
            libdb-dev \
            libdb++-dev \
            libboost-all-dev \
            libqrencode-dev \
            libminiupnpc-dev \
            miniupnpc

# ===============================================================================
# Set working directory
#
WORKDIR /work

# ===============================================================================
# Install configuration
#

RUN mkdir -p /root/.FreakChain/
COPY docker/config/FreakChain.conf /root/.FreakChain/
RUN chmod u+r-wx,g-rwx,o-rwx /root/.FreakChain/FreakChain.conf

# ===============================================================================
# System Initialization
#

## Copy folders
COPY share /work/share
COPY src /work/src

RUN cd src && \
    /usr/bin/make -f makefile.unix USE_UPNP=1 USE_IPV6=1 USE_QRCODE=1

# Set default CMD
CMD /work/src/FreakChaind && tail -f -n 10 /root/.FreakChain/debug.log

EXPOSE 15555 16555 16556 15556
ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}
RUN apt-get update && \
    apt-get install -y bash-completion vim curl zip unzip bzip2 wget && \
    apt-get install -y build-essential gcc && \
    apt-get install -y libatlas-base-dev libfreetype6-dev libpng-dev libhdf5-serial-dev

ARG PROCESSOR_FAMILY=x86_64
ENV PROCESSOR_FAMILY=${PROCESSOR_FAMILY}

# TO DO - error in RPi32
# amybe https://github.com/geerlingguy/internet-pi/pull/11 ?
# Run privilieged? https://github.com/linuxserver/docker-calibre-web/issues/119#issuecomment-793000917
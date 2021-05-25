ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}
RUN apt-get update && \
    apt get install -y bash-completion vim curl zip unzip bzip2 wget && \
    apt-get install -y build-essential gcc && \
    apt-get install -y libatlas-base-dev libfreetype6-dev libpng-dev libhdf5-serial-dev && \
    apt-get install -y python3.9 python3.9-dev

ARG PROCESSOR_FAMILY=x86_64
ENV PROCESSOR_FAMILY=${PROCESSOR_FAMILY}

# Create a base Python environment on which to build other images

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3.9 get-pip.py

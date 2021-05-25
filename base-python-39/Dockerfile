ARG BASE_IMAGE=ubuntu:20.04
FROM ${BASE_IMAGE}
RUN apt-get update && apt-get install -y python3.9 python3.9-dev

ARG PROCESSOR_FAMILY=x86_64
ENV PROCESSOR_FAMILY=${PROCESSOR_FAMILY}

# Create a base Python environment on which to build other images

RUN apt-get update && apt-get install -y python3-pip && \
    python3 -m pip install --upgrade pip

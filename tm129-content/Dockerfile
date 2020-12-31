# syntax = docker/dockerfile:experimental
ARG BASE_IMAGE=ouvocl/vce-tm129
FROM $BASE_IMAGE

USER root
WORKDIR $HOME
RUN wget -P downloads https://github.com/innovationOUtside/tm129-robotics2020/archive/master.zip && \
    unzip -oq downloads/master.zip tm129-robotics2020-master/content/* -d downloads/ && \
    mv downloads/tm129-robotics2020-master/content/ content/ && \
    rm -r downloads && chown -R $NB_USER content

USER $NB_USER

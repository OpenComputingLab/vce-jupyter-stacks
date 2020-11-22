# Originally copyright (c) Jupyter Development Team.
# Modified by Tony Hirst
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=ouvocl/vce-jupyter-pandas
FROM $BASE_CONTAINER

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get install --upgrade -y libhdf5-dev gfortran libatlas-base-dev libopenblas-dev liblapack-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
COPY ./wheelhouse/ ./wheelhouse/
RUN echo scipy scikit_learn numexpr h5py tables statsmodels | xargs -n 1 pip install --no-cache --find-links=./wheelhouse && rm -r ./wheelhouse

USER $NB_UID

RUN pip install --no-cache  \
    'plotly' \ 
    'seaborn'

WORKDIR $HOME
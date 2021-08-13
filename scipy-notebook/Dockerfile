# Originally copyright (c) Jupyter Development Team.
# Modified by Tony Hirst
# Distributed under the terms of the Modified BSD License.
ARG BASE_IMAGE=ouvocl/jupyter-pandas
FROM $BASE_IMAGE

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get install --upgrade -y libhdf5-dev gfortran libatlas-base-dev libopenblas-dev liblapack-dev && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
#COPY ./wheelhouse/ ./wheelhouse/
# If we add wheels for every platfrom, we can add --no-index
#RUN echo scipy scikit_learn numexpr h5py tables statsmodels | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse
RUN for p in numexpr scipy scikit_learn h5py tables statsmodels ; do echo "$p" | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse; done
#--find-links=./wheelhouse && rm -r ./wheelhouse

RUN pip install --no-cache  \
    'plotly' \ 
    'seaborn'

USER $NB_UID

WORKDIR $HOME

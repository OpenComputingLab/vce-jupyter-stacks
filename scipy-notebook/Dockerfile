# Originally copyright (c) Jupyter Development Team.
# Modified by Tony Hirst
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=ouvocl/vce-jupyter-pandas
FROM $BASE_CONTAINER

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"


USER $NB_UID

# Install Python 3 packages
COPY ./wheelhouse/ ./wheelhouse/
RUN echo scipy scikit_learn | xargs -n 1 pip install --find-links=./wheelhouse && rm -r ./wheelhouse

RUN fix-permissions "/home/${NB_USER}"


WORKDIR $HOME
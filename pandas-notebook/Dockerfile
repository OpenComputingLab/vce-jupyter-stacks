# Originally copyright (c) Jupyter Development Team.
# Modified by Tony Hirst
# Distributed under the terms of the Modified BSD License.
ARG BASE_CONTAINER=ouvocl/vce-jupyter-base
FROM $BASE_CONTAINER

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

# Install Python 3 packages
COPY ./wheelhouse/ ./wheelhouse
RUN echo kiwisolver matplotlib Pillow numpy pandas pyzmq | xargs -n 1 pip install --find-links=./wheelhouse && rm -r ./wheelhouse

RUN pip install \
    'beautifulsoup4' \
    'cython' \
    'dill' \
    'h5py' \
    'ipywidget' \
    'ipympl'\
    'pytables' \
    'seaborn' \
    'statsmodels' \
    'widgetsnbextension'\
    'xlrd' \
    && \
    # Activate ipywidgets extension in the environment that runs the notebook server
    jupyter nbextension enable --py widgetsnbextension --sys-prefix && \
    fix-permissions "/home/${NB_USER}"


# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot" && \
    fix-permissions "/home/${NB_USER}"

USER $NB_UID

WORKDIR $HOME
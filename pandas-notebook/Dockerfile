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
    # Pillow support?
    apt-get install -y libjpeg-dev zlib1g-dev libfreetype6-dev  libopenjp2-7 libtiff5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
COPY ./wheelhouse/ ./wheelhouse
RUN echo kiwisolver matplotlib Pillow numpy pandas pyzmq | xargs -n 1 pip install --find-links=./wheelhouse && rm -r ./wheelhouse

USER $NB_UID

RUN pip install --no-cache --extra-index-url=https://www.piwheels.org/simple \
    'beautifulsoup4' \
    'cython' \
    'dill' \
    'ipywidgets' \
    'ipympl' \
    'widgetsnbextension'\
    'xlrd'

# Activate ipywidgets extension in the environment that runs the notebook server
#RUN jupyter nbextension enable --py widgetsnbextension --sys-prefix
#RUN fix-permissions "/home/${NB_USER}"


# Import matplotlib the first time to build the font cache.
#ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"

#RUN MPLBACKEND=Agg python -c "import matplotlib.pyplot"

USER $NB_UID

WORKDIR $HOME
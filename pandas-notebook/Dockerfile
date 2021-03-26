# Originally copyright (c) Jupyter Development Team.
# Modified by Tony Hirst
# Distributed under the terms of the Modified BSD License.
ARG BASE_IMAGE=ouvocl/jupyter-base
FROM $BASE_IMAGE

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"

USER root

# ffmpeg for matplotlib anim & dvipng+cm-super for latex labels
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
    # Pillow support?
    apt-get install -y  libopenblas-dev libblis2-serial libjpeg-dev zlib1g-dev libfreetype6-dev  libopenjp2-7 libtiff5 && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python 3 packages
#COPY ./wheelhouse/ ./wheelhouse
# If we add wheels for every platfrom, we can add --no-index
RUN echo kiwisolver matplotlib Pillow numpy pandas lxml pyzmq PyYAML | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse
#--find-links=./wheelhouse && rm -r ./wheelhouse

#USER $NB_UID

RUN pip install --no-cache --extra-index-url=https://www.piwheels.org/simple \
    'beautifulsoup4' \
    'cython' \
    'dill' \
    'ipywidgets' \
    'ipympl' \
    'widgetsnbextension'\
    'xlrd'

#USER root
# Import matplotlib the first time to build the font cache.
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/"
RUN bash -c 'MPLBACKEND=Agg python -c "import matplotlib.pyplot"'

# Activate ipywidgets extension in the environment that runs the notebook server
RUN fix-permissions "/home/${NB_USER}" && jupyter nbextension enable --py widgetsnbextension --user


USER $NB_UID

WORKDIR $HOME
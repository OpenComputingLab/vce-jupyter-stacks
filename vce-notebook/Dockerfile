ARG BASE_IMAGE=ouvocl/vce-jupyter-base
FROM $BASE_IMAGE

LABEL maintainer="Tony Hirst <tony.hirst@open.ac.uk>"

USER root


# Install Python 3 packages
COPY ./wheelhouse/ ./wheelhouse
# If we add wheels for every platfrom, we can add --no-index
RUN echo aiohttp kiwisolver lxml PyYAML yarl matplotlib| xargs -n 1 pip install --no-cache --find-links=./wheelhouse && rm -r ./wheelhouse


RUN pip install --no-cache --extra-index-url=https://www.piwheels.org/simple \
    'cython' \
    'dill' \
    'ipywidgets' \
    'widgetsnbextension' \
    'myst-nb' \
    'jupytext' \
    'jupyter-server-proxy' \
    'nbzip' \
    'jupyter_contrib_nbextensions' \
    'jupyter-wysiwyg' \
    'jupyterthemes' \
    'nbresuse' \
    'tqdm' \
    'nbtutor' \
    'RISE' \
    'nb-extension-tagstyler' \
    'nb-extension-empinken' \
    'nb-cell-execution-status'


# Activate ipywidgets extension in the environment that runs the notebook server
RUN fix-permissions "/home/${NB_USER}" && jupyter nbextension enable --py widgetsnbextension --user

USER $NB_UID

WORKDIR $HOME
# syntax = docker/dockerfile:experimental
ARG BASE_IMAGE=ouvocl/vce-scipy
FROM $BASE_IMAGE

USER root

# Is nodejs really required or is it a build dependency?
RUN apt-get update \
 && apt-get install -yq --no-install-recommends \
 nodejs &&\
 apt-get clean && rm -rf /var/lib/apt/lists/*


#COPY ./wheelhouse/ ./wheelhouse/
# Save the effort of building wheels
#RUN --mount=type=bind,target=./wheelhouse/,source=./wheelhouse/ echo jp_proxy_widget | xargs -n 1 pip install --no-cache --find-links=./wheelhouse
# If we add wheels for every platform, we can add --no-index
#RUN --mount=type=bind,target=./wheelhouse/,source=./wheelhouse/ echo SQLAlchemy PyYAML durable-rules lxml yarl multidict aiohttp psutil tflite_runtime | xargs -n 1 pip install --no-cache --find-links=./wheelhouse
RUN echo jp_proxy_widget | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse
RUN echo SQLAlchemy PyYAML durable-rules lxml yarl multidict aiohttp psutil tflite_runtime | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse


#USER $NB_USER

RUN pip3 install --no-cache --extra-index-url=https://www.piwheels.org/simple myst-nb jupytext
RUN pip3 install --no-cache --extra-index-url=https://www.piwheels.org/simple blockdiag blockdiagMagic
RUN pip3 install --no-cache --extra-index-url=https://www.piwheels.org/simple ou-tm129-py

# x86_64, armv7l,
ARG PROCESSOR_FAMILY=x86_64
#ARG NODE_LATEST=latest-v16.x
#ARG NODE_VERSION=v16.3.0

#USER root

#RUN wget https://nodejs.org/dist/${NODE_LATEST}/node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz && \
#    tar xvzf node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz  &&  \
#    mkdir -p /opt/node && cp -r node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}/* /opt/node && \
#    ln -s /opt/node/bin/node /usr/bin/node && ln -s /opt/node/lib/node /usr/lib/node && \
#    ln -s /opt/node/bin/npm /usr/bin/npm && ln -s /opt/node/bin/node-waf /usr/bin/node-waf && \
#    rm node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz # && rm -r node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}

# Is nodejs really required or is it a build dependency?
#RUN apt-get update \
# && apt-get install -yq --no-install-recommends \
# nodejs &&\
# apt-get clean && rm -rf /var/lib/apt/lists/*


#RUN apt-get install -y gfortran libatlas-base-dev libopenblas-dev liblapack-dev

#USER $NB_USER

#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple scipy

#RUN pip3 wheel --wheel-dir=./wheelhouse scikit-learn && pip3 install --no-index --find-links=./wheelhouse scikit-learn
#COPY jp_proxy_widget-master.zip ./jp_proxy_widget-master.zip
#RUN pip3 wheel --wheel-dir=./wheelhouse ./jp_proxy_widget-master.zip &&  pip3 install --find-links=./wheelhouse --user --no-cache jp_proxy_widget  && pip3 install --user --no-cache --upgrade tqdm && pip3 install --user --no-deps nbev3devsim && pip3 install --user --extra-index-url=https://www.piwheels.org/simple --no-cache ou-tm129-py
#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple  --user --no-cache ./jp_proxy_widget-master.zip   && pip3 install --user --no-cache --upgrade tqdm && pip3 install --user --no-deps nbev3devsim && pip3 install --user --extra-index-url=https://www.piwheels.org/simple --no-cache ou-tm129-py

#USER root
COPY postBuild ./postBuild
RUN chmod ugo+x ./postBuild
#USER $NB_USER
RUN ./postBuild
USER root
RUN rm postBuild
#RUN rm jp_proxy_widget-master.zip
USER $NB_USER

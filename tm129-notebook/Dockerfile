FROM ouvocl/vce-jupyter-scipy

USER root
COPY ./wheelhouse/ ./wheelhouse/
# Save the effort of building wheels
RUN echo SQLAlchemy PyYAML durable-rules lxml yarl multidict aiohttp psutil tflite_runtime | xargs -n 1 pip install --no-cache --find-links=./wheelhouse && rm -r ./wheelhouse

USER $NB_USER

RUN pip3 install --no-cache --extra-index-url=https://www.piwheels.org/simple myst-nb jupytext
RUN pip3 install --no-cache --extra-index-url=https://www.piwheels.org/simple  blockdiag blockdiagMagic

# x86_64, armv7l
ARG PROCESSOR_FAMILY=x86_64
ARG NODE_VERSION=v15.3.0

USER root

RUN wget https://nodejs.org/dist/latest-v15.x/node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz && tar xvzf node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz  &&  mkdir -p /opt/node && cp -r node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}/* /opt/node && ln -s /opt/node/bin/node /usr/bin/node && ln -s /opt/node/lib/node /usr/lib/node && ln -s /opt/node/bin/npm /usr/bin/npm && ln -s /opt/node/bin/node-waf /usr/bin/node-waf && rm node-${NODE_VERSION}-linux-${PROCESSOR_FAMILY}.tar.gz

#RUN apt-get install -y gfortran libatlas-base-dev libopenblas-dev liblapack-dev

USER $NB_USER

#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple scipy

#RUN pip3 wheel --wheel-dir=./wheelhouse scikit-learn && pip3 install --no-index --find-links=./wheelhouse scikit-learn
RUN pip3 install --no-cache https://github.com/AaronWatters/jp_proxy_widget/archive/master.zip && pip3 install --no-cache --upgrade tqdm && pip3 install --no-deps nbev3devsim && pip3 install --extra-index-url=https://www.piwheels.org/simple --no-cache ou-tm129-py

USER root
COPY postBuild ./postBuild
RUN chmod +x ./postBuild && ./postBuild && rm postBuild
USER $NB_USER
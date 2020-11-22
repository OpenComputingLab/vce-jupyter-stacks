FROM ouvocl/vce-jupyter-scipy

RUN pip3 install --extra-index-url=https://www.piwheels.org/simple myst-nb jupytext
RUN wget https://nodejs.org/dist/latest-v15.x/node-v15.2.0-linux-armv7l.tar.gz  &&  tar xvzf node-v15.2.0-linux-armv7l.tar.gz  &&  mkdir -p /opt/node && cp -r node-v15.2.0-linux-armv7l/* /opt/node && ln -s /opt/node/bin/node /usr/bin/node && ln -s /opt/node/lib/node /usr/lib/node && ln -s /opt/node/bin/npm /usr/bin/npm && ln -s /opt/node/bin/node-waf /usr/bin/node-waf && rm node-v15.2.0-linux-armv7l.tar.gz

RUN pip3 install --extra-index-url=https://www.piwheels.org/simple blockdiag blockdiagMagic

#RUN apt-get install -y gfortran libatlas-base-dev libopenblas-dev liblapack-dev
#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple scipy

RUN pip3 install --no-index --find-links=./wheelhouse durable-rules

#RUN pip3 wheel --wheel-dir=./wheelhouse scikit-learn && pip3 install --no-index --find-links=./wheelhouse scikit-learn
RUN pip3 install https://github.com/AaronWatters/jp_proxy_widget/archive/master.zip
RUN pip3 install --upgrade tqdm && pip3 install --no-deps nbev3devsim && pip3 install ou-tm129-py
FROM ouvocl/vce-jupyter-scipy

#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple 

USER root
RUN apt-get update -y && apt-get install -y libproj-dev \
  gdal-bin \
  libgdal-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./wheelhouse/ ./wheelhouse/
# Raspbian buster only supports pytpo to 5.2
# so need to retrogade some other geo packages
RUN echo regex lxml pyproj==1.9.6 fiona shapely nltk multidict yarl aiohttp psycopg2-binary psycopg2 SQLAlchemy PyYAML pymongo | xargs -n 1 pip install --no-cache --find-links=./wheelhouse && rm -r ./wheelhouse

USER $NB_USER
RUN pip install --no-cache --extra-index-url=https://www.piwheels.org/simple geopandas==0.5.1 && pip install --no-cache --extra-index-url=https://www.piwheels.org/simple ou-tm351-py


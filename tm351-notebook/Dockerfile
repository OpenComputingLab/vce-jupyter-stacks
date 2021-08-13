ARG BASE_IMAGE=ouvocl/vce-scipy
FROM $BASE_IMAGE


#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple 

USER root
RUN apt-get update && apt-get install -y libproj-dev \
  gdal-bin \
  libgdal-dev \
  libicu-dev \
  tree \
  graphviz \
  libgraphviz-dev \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

#COPY ./wheelhouse/ ./wheelhouse/
# Raspbian buster only supports proj to 5.2
# so need to retrogade some other geo packages eg geopandas==0.5.1
# no pynacl wheel for RPi32 either
# If we add wheels for every platform, we can add --no-index
# Earlier version: pyproj==1.9.6
#RUN echo psycopg2-binary | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse && \
#    echo PyICU pynacl regex lxml pyproj fiona shapely nltk multidict yarl aiohttp psycopg2 SQLAlchemy PyYAML pymongo | xargs -n 1 pip install --no-cache --find-links=https://opencomputinglab.github.io/vce-wheelhouse

RUN pip install --no-cache --extra-index-url=https://www.piwheels.org/simple geopandas && pip install --upgrade --no-cache --extra-index-url=https://www.piwheels.org/simple ou-tm351-py>=0.0.3

USER $NB_USER

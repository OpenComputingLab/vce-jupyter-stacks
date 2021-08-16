ARG BASE_IMAGE=ouvocl/vce-tm351
FROM $BASE_IMAGE

USER root
#
# Add postgres
# Create the file repository configuration:
# Create the file repository configuration:
#RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# Import the repository signing key:
#RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -  && \
        # Update the package lists:
#        apt-get update && \
        # Install the latest version of PostgreSQL.
        # If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
#        apt-get -y install postgresql
RUN apt-get update && apt-get install -y postgresql
RUN PG_DB_DIR=/var/db/data/postgres && mkdir -p $PG_DB_DIR

# Add Mongo
#COPY .mongo_version .mongo_version
#RUN MONGODB_VERSION=4.2.12
#$(<.mongo_version) #4.2.8 #3.6.15
#ARG MONGODB_PATH=/var/srv/mongodb-$MONGODB_VERSION
#ARG MONGODB_BASE=mongodb-linux-x86_64-debian10
#https://www.mongodb.org/dl/linux/
# https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-debian10-4.2.12.tgz
#https://fastdl.mongodb.org/linux/${MONGODB_BASE}-3.6.15.tgz
#wget -q https://fastdl.mongodb.org/linux/${MONGODB_BASE}-${MONGODB_VERSION}.tgz
# Should we detect the Linux version?
#RUN wget -q https://fastdl.mongodb.org/linux/${MONGODB_BASE}-${MONGODB_VERSION}.tgz \
#    && tar -xvf ${MONGODB_BASE}-${MONGODB_VERSION}.tgz >/dev/null \
#    && rm ${MONGODB_BASE}-${MONGODB_VERSION}.tgz \
#    && mv ${MONGODB_BASE}-${MONGODB_VERSION} ${MONGODB_PATH}
RUN apt-get update && apt-get install -y gnupg && \
    wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
#RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

#Ubuntu 20.04
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

#RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-get update && apt-get install -y mongodb-org


# Add OpenRefine
RUN apt-get update && apt-get install -y openjdk-11-jre
ARG OPENREFINE_VERSION=3.4.1
ARG OPENREFINE_PATH=/var/openrefine
ENV PATH="${OPENREFINE_PATH}:${PATH}"
RUN wget -q -O openrefine-${OPENREFINE_VERSION}.tar.gz https://github.com/OpenRefine/OpenRefine/releases/download/${OPENREFINE_VERSION}/openrefine-linux-${OPENREFINE_VERSION}.tar.gz \
        && tar xzf openrefine-${OPENREFINE_VERSION}.tar.gz \
        && mv openrefine-${OPENREFINE_VERSION} $OPENREFINE_PATH \
        && rm openrefine-${OPENREFINE_VERSION}.tar.gz
RUN pip install nb_serverproxy_openrefine


# POSTGRES
RUN sed -e "s/[#]\?listen_addresses = .*/listen_addresses = '*'/g" -i '/etc/postgresql/12/main/postgresql.conf'

# Changing datadir
# https://magicesp.com/howto/ubuntu-server-20.04/postgresql/move-postgresql-data-files-change-cluster-location
#RUN sed -e "s/[#]\?data_directory = .*/data_directory = 'NEW_DATA_DIR'/g" -i '/etc/postgresql/12/main/postgresql.conf'

# No env var is set? How can we set this properly, eg from pg_lsclusters?
ARG PGDATA=/var/lib/postgresql/12/main

RUN mkdir -p /var/setup
COPY init_db /var/setup/init_db_seed
RUN chmod +x /var/setup/init_db_seed/postgres/init_db.sh

#RUN apt-get install -y gosu
#COPY init_db/postgres /docker-entrypoint-initdb.d/
#ENV PG_ENTRYPOINT /var/startup/postgres-entrypoint
#COPY postgres-entrypoint /var/startup/postgres-entrypoint
#RUN chmod +x /var/startup/postgres-entrypoint


USER postgres

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=tm351db

ENV PGDATA=$PGDATA


#RUN if [ ! -d "$PGDATA" ]; then initdb -D "$PGDATA" --auth-host=md5 --encoding=UTF8 ; fi && \
#    pg_ctl -D "$PGDATA" -l "$PGDATA/pg.log" start
#Copy the initialisation files into the final container
#COPY postgresql.conf /etc/postgresql/11/main/ 

# LOOKUP DATADIR pg_lsclusters
# or: sudo -u postgres psql AND THEN: SHOW data_directory;
RUN service postgresql restart && psql postgres -f /var/setup/init_db_seed/postgres/init_db.sql && \
   /var/setup/init_db_seed/postgres/init_db.sh  
    #Put an equivalent of the above in a config file: init_db.sql
    #psql -U postgres postgres -f init_db.sql
    #psql test < seed_db.sql
    #pg_ctl -D "$PGDATA" -l "$PGDATA/pg.log" stop
# if we don't stop it, can bad things happen on shutdown?
 #&& service postgresql stop

 #pg_isready
USER $NB_USER
USER root

ARG MONGO_DB_PATH=/var/db/data/mongo
ENV MONGO_DB_PATH=${MONGO_DB_PATH}
COPY ./init_db /var/setup/


RUN mkdir -p ${MONGO_DB_PATH}

RUN mkdir -p /var/setup/tmpdatafiles && \
    tar xvjf /var/setup/init_db_seed/mongo/small_accidents.tar.bz2 -C /var/setup/tmpdatafiles  && \
    mongod --fork --logpath /var/log/mongosetup --dbpath ${MONGO_DB_PATH} && \
    mongorestore --drop --db accidents /var/setup/tmpdatafiles/small_accidents && \
    rm -rf /var/setup/tmpdatafiles && rm -rf /var/setup/init_db
#    mongod --shutdown --dbpath ${MONGO_DB_PATH} 

RUN usermod -a -G postgres jovyan

RUN mkdir -p /var/dist
COPY content/* /var/dist/content/
#RUN chown -R $NB_USER /var/dist/content

COPY start /var/startup/start
RUN chmod +x /var/startup/start

COPY start_mongo /var/startup/start_mongo
RUN chmod u+x /var/startup/start_mongo

ENV R2D_ENTRYPOINT /var/startup/start
COPY repo2docker-entrypoint /usr/local/bin/repo2docker-entrypoint
COPY python3-login /usr/local/bin/python3-login
RUN chmod +x /usr/local/bin/repo2docker-entrypoint
RUN chmod +x /usr/local/bin/python3-login

# Update permissions to run the db services locally
RUN echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /sbin/service postgresql restart" >> /etc/sudoers && \
    echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /usr/bin/mongod" >> /etc/sudoers && \
    #echo "$NB_USER ALL = (postgres) NOPASSWD: ALL" && \
    echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /var/startup/start_jh_extras" >> /etc/sudoers && \
    echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /var/startup/start_mongo" >> /etc/sudoers

RUN VERSION="TM351_21J_0.01" && DATE=`date +%Y-%m-%d/%H:%M.%S` && \
    echo "Version: ${VERSION} - build time: ${DATE}." > /opt/version.txt

# Copy start up files
COPY .jupyter /var/dist/.jupyter

# Check we've updated ou-tm351-py packages
RUN pip install --upgrade "ou-tm351-py>=0.0.8"

RUN fix-permissions $HOME
ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint", "tini", "-g", "--"]
CMD ["start-notebook.sh"]

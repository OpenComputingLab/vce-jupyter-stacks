ARG BASE_IMAGE=ouvocl/vce-tm351
FROM $BASE_IMAGE

USER root
#
# Add postgres
# Create the file repository configuration:
#RUN sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
    # Import the repository signing key:
#   && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
#    && apt-get update && apt-get -y install postgresql

# Install the latest version of PostgreSQL.
##RUN rm -rf /var/lib/apt/lists/* 
RUN apt update && apt-get install -y postgresql && apt-get clean
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
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
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
RUN pip install --no-cache git+https://github.com/innovationOUtside/nb_serverproxy_openrefine.git

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
#ENV POSTGRES_DB=my_database_name
ARG PGDATA=${PGDATA}:-${PG_DB_DIR}
RUN if [ ! -d "$PGDATA" ]; then initdb -D "$PGDATA" --auth-host=md5 --encoding=UTF8 ; fi && \
    pg_ctl -D "$PGDATA" -l "$PGDATA/pg.log" start
#Copy the initialisation files into the final container
#COPY postgresql.conf /etc/postgresql/11/main/ 
RUN sed -e "s/[#]\?listen_addresses = .*/listen_addresses = '*'/g" -i '/etc/postgresql/12/main/postgresql.conf'
COPY init_db init_db_seed
RUN chmod +x ./init_db_seed/postgres/init_db.sh

#RUN apt-get install -y gosu
#COPY init_db/postgres /docker-entrypoint-initdb.d/
#ENV PG_ENTRYPOINT /var/startup/postgres-entrypoint
#COPY postgres-entrypoint /var/startup/postgres-entrypoint
#RUN chmod +x /var/startup/postgres-entrypoint
USER postgres
RUN service postgresql restart && psql postgres -f ./init_db_seed/postgres/init_db.sql && \
   ./init_db_seed/postgres/init_db.sh  
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
COPY ./init_db ./

RUN mkdir -p ${MONGO_DB_PATH}

RUN mkdir -p ./tmpdatafiles && \
    tar xvjf ./init_db_seed/mongo/small_accidents.tar.bz2 -C ./tmpdatafiles  && \
    mongod --fork --logpath /var/log/mongosetup --dbpath ${MONGO_DB_PATH} && \
    mongorestore --drop --db accidents ./tmpdatafiles/small_accidents && \
    rm -rf ./tmpdatafiles && rm -rf ./init_db
#    mongod --shutdown --dbpath ${MONGO_DB_PATH} 

RUN usermod -a -G postgres jovyan
COPY content content

COPY start /var/startup/start
RUN chmod +x /var/startup/start
ENV R2D_ENTRYPOINT /var/startup/start
COPY repo2docker-entrypoint /usr/local/bin/repo2docker-entrypoint
COPY python3-login /usr/local/bin/python3-login
RUN chmod +x /usr/local/bin/repo2docker-entrypoint
RUN chmod +x /usr/local/bin/python3-login
ENTRYPOINT ["/usr/local/bin/repo2docker-entrypoint", "tini", "-g", "--"]
CMD ["start-notebook.sh"]

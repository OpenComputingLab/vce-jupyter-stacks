FROM mongo

COPY ./data/small_accidents.tar.bz2 /tmp/small_accidents.tar.bz2
RUN chmod a+r /tmp/small_accidents.tar.bz2

COPY ./init_db.sh /docker-entrypoint-initdb.d/
RUN chmod a+x /docker-entrypoint-initdb.d/*.sh && chmod a+r /docker-entrypoint-initdb.d/*
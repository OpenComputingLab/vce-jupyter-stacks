#FROM ouvocl/vce-tm351-monolith
FROM ousefuldemos/tm351monolithtestdelme
#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple 


USER root
# Additional requirements for hosted solution
RUN pip install jupyterhub

RUN touch /var/log/jupyter-server-log.txt && \
    chown $NB_USER /var/log/jupyter-server-log.txt

#RUN echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /sbin/service postgresql restart" >> /etc/sudoers && \
#    echo "$NB_USER ALL=(ALL:ALL) NOPASSWD: /usr/bin/mongod" >> /etc/sudoers

COPY start_jh_extras /var/startup/start_jh_extras
RUN chmod +x /var/startup/start_jh_extras

ENV JHPG /home/$NB_USER/.postgres
ENV PGDATA /home/$NB_USER/.postgres/12/main

ENV JHMONGO /home/$NB_USER/.mongo
ENV MONGO_DB_PATH /home/$NB_USER/.mongo

USER $NB_USER

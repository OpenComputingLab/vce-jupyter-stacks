FROM ouvocl/vce-tm351-monolith

#RUN pip3 install --extra-index-url=https://www.piwheels.org/simple 

USER root
# Additional requirements for hosted solution
RUN pip install jupyterhub

RUN touch /var/log/jupyter-server-log.txt && \
    chown $NB_USER /var/log/jupyter-server-log.txt
USER $NB_USER


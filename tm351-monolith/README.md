# `tm351-monolith`

![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv64-blue) ![](https://img.shields.io/badge/RPi-64bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Postgres: ![](https://img.shields.io/badge/postgres-12-blue)  
MongoDB: ![](https://img.shields.io/badge/mongo-4.4.6-green)  
OpenRefine: ![](https://img.shields.io/badge/openrefine-3.4.1-orange)  

Single image containing all required packages and services, including:

- PostgreSQL database
- MongoDB database
- OpenRefine

`docker run --name tm351vce --rm -d -p 8351:8888 -v "$PWD/:/home/jovyan/notebooks" ouvocl/vce-tm351-monolith`

## Architecture

The image buid on the base Python environment ([`tm351-notebook`](https://github.com/OpenComputingLab/vce-jupyter-stacks/tree/main/tm351-notebook)) by installing the additional services as well as a `start` process (inspired by the [MyBinder `start` feature](https://mybinder.readthedocs.io/en/latest/config_files.html#start-run-code-before-the-user-sessions-starts)) to start the services when the container is launched.

Further information: [Running Arbitrary Startup Scripts in Docker Containers](https://blog.ouseful.info/2021/05/26/running-arbitrary-startup-scripts-in-docker-containers/)


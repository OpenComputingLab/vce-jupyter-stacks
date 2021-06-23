# `tm351-notebook`
![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv64-blue)

![](https://img.shields.io/badge/RPi-64bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Notebook environment for the Open University module [TM351 *Data Management and Analysis*](http://www.open.ac.uk/courses/modules/tm351).

Published on DockerHub as: [`ouvocl/vce-tm351`](https://hub.docker.com/r/ouvocl/vce-tm351)

The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.


## Accessing Additional Services
The container provides a relatively complete Python environment, but does not include database services (Postgres, Mongo) or OpenRefine.

Two solutions are provided for runnning the complete environment:

- a Docker Compose network — [`tm351-compose`](https://github.com/OpenComputingLab/vce-jupyter-stacks/tree/main/tm351-compose) of interconnected containers, each running a separate service;
- a monolithic container bundling all the services into a single image: [`tm351-monolith`](https://github.com/OpenComputingLab/vce-jupyter-stacks/tree/main/tm351-monolith). A further image — [`tm351-notebook-jh`](https://github.com/OpenComputingLab/vce-jupyter-stacks/tree/main/tm351-notebook-jh) — adds a JupyterHub wrapper and copies database directories over to a presumed shared volume.

A graphical user interface tool, Portainer, that supports the launching of individual and composed containers, is also under exploration; for current thinking on this, see [here](https://docs.google.com/document/d/1pRKTaYbvzZJ4n3Ww_ShGURcJdIHBQhOjQdgCSviUV3o/edit?usp=sharing).


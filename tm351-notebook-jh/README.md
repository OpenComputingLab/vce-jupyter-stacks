# `tm351-notebook-jh`
![](https://img.shields.io/badge/linux-x86_64-blue) 

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Notebook environment for the Open University module [TM351 *Data Management and Analysis*](http://www.open.ac.uk/courses/modules/tm351) with additional JupyterHub installation.

Published on DockerHub as: [`ouvocl/vce-tm351-jh`](https://hub.docker.com/r/ouvocl/vce-tm351-jh)

The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.


## Currently incomplete

- lacking `postBuild` environment configuration steps

## Accessing Additional Services
The container does not include database services. The intention is that database servers will run in their own containers, with containers managed using `docker-compose`.  See for example: https://github.com/OpenComputingLab/locl-templates/tree/main/stack . For a UI that can spawn pre-configured environments created from multiple containers, see [here](https://docs.google.com/document/d/1pRKTaYbvzZJ4n3Ww_ShGURcJdIHBQhOjQdgCSviUV3o/edit?usp=sharing).


# `tm129-notebook`
![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv7l-blue)

![](https://img.shields.io/badge/RPi-32bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Notebook environment for the Open University module [TM129 *Technologies in practice*](http://www.open.ac.uk/courses/modules/tm129).

Published on DockerHub as: [`ouvocl/vce-tm129`](https://hub.docker.com/r/ouvocl/vce-tm129)

The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.

## Currently incomplete

- lacking `postBuild` environment configuration steps
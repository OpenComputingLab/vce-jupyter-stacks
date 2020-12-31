# `pandas-notebook`
![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv7l-blue)  ![](https://img.shields.io/badge/linux-armv64-blue)

![](https://img.shields.io/badge/RPi-32bitOS-red) ![](https://img.shields.io/badge/RPi-64bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Jupyter notebook environment with `pandas` support.

Published on DockerHub as: [`ouvocl/jupyter-pandas`](https://hub.docker.com/r/ouvocl/jupyter-pandas)

There is also a version with a customised Jupyter notebook environment as: [`ouvocl/vce-pandas`](https://hub.docker.com/r/ouvocl/vce-pandas)

The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.

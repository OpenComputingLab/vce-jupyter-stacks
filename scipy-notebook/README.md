# `scipy-notebook`
![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv7l-blue)  ![](https://img.shields.io/badge/linux-armv64-blue)

![](https://img.shields.io/badge/RPi-32bitOS-red)  ![](https://img.shields.io/badge/RPi-64bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Jupyter notebook environment with `scipy` support.

Published on DockerHub as: [`ouvocl/jupyter-scipy`](https://hub.docker.com/r/ouvocl/jupyter-scipy)

There is also a version with a customised Jupyter notebook environment as: [`ouvocl/vce-scipy`](https://hub.docker.com/r/ouvocl/vce-scipy)


The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.

Example start command:

- create a directory for your notebooks: `mkdir -p localnotebooks`
- *download and install Docker)
- download and run a docker container that shares the contents of `localnotebooks` directory into the `notebooks` directory on the container:
`docker run --name scipy_container -d -p 8899:8888 -v "$PWD/delme3:/home/jovyan/notebooks" -e JUPYTER_TOKEN="letmein" ouvocl/vce-scipy`

Wait a few moments and then got to `localhost:8899` or open the container homepage from the container list item in DOcker Dashboard.

# `tm129-content`
![](https://img.shields.io/badge/linux-x86_64-blue) ![](https://img.shields.io/badge/linux-armv7l-blue)

![](https://img.shields.io/badge/RPi-32bitOS-red)

Jupyter kernels: ![](https://img.shields.io/badge/python-3.8-blue)

Notebook environment for the Open University module [TM129 *Technologies in practice*](http://www.open.ac.uk/courses/modules/tm129).

Published on DockerHub as: [`ouvocl/vce-tm129-content`](https://hub.docker.com/r/ouvocl/vce-tm129-content)

The notebook is token protected. To login, use the token: `letmein`

Start the container with the flag `-e JUPYTER_TOKEN="my-new-token"` to specify your own token.


## Getting Started

```
# update the image
docker pull ouvocl/vce-tm129-content
# clear any old container
docker rm -f tm129vce
# launch new container
docker run -d -p 8129:8888 --name tm129vce -v "$PWD/TM129VCE":/home/jovyan/shared  ouvocl/vce-tm129-content
```

## Currently incomplete??

- lacking `postBuild` environment configuration steps??

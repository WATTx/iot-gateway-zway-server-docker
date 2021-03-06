# Z-Way Server on Docker

## Overview

At the moment there wasn't a Docker image with the Z-way server available. This repo contains the steps and files to build one yourself. There are two approaches how to get this running:

* Building your own image. In which case you can modify what you wan't but need to go through multiple steps and it takes longer
* Using the image from dockerhub. In which case the image was prebuilt with the Dockerfile from the repository and you can pull it and run it directly.

## Requirements
Docker >= 1.9


## Using the image from dockerhub
```
docker pull wattx/z-way-server-ubuntu:2.2.2
docker run -it --privileged -v config-zway:/home/user/app -p 8083:8083 wattx/z-way-server-ubuntu:2.2.2
```
Open browser on the host. URL: http://localhost:8083

## Building your own image

Instead of versioning the whole server, before building the Docker image the source has to be pulled. If you want to chage the Z-way server version, check the SERVER_IMAGE variable in the Makefile.

1. make build
2. make run
3. Open browser on the host. URL: http://localhost:8083


## Persistency mechanism

Persistency of the Z-way configuration is maintained by using a Docker named volume 'config-zway'. In case you want to restart the configuration at some point an start over anew, delete the volume:

```
docker rm $(docker ps -q -f status=exited)
docker volume rm config-zway
```

## Known issues

If you press the "Reset API" in the Expert UI it might result in having the USB device be recognised under a different name (ttyACM1 while it was ttyACM0 before the restart).
In that case you need to stop the container.
Reattach the USB stick so it's back to ttyACM0.
Start the container again.

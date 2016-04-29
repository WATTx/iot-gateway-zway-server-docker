# Z-Way Server on Docker

## Overview

At the moment there wasn't a Docker image with the Z-way server available. This repo contains the steps and files to build one yourself.

## Usage

Instead of versioning the whole server, before building the Docker image the source has to be pulled. If you want to chage the Z-way server version, check the SERVER_IMAGE variable in the Makefile.

1. make get-source
2. make build
3. make run
4. Open browser on the host. URL: http://localhost:8083

## Known issues

If you press the "Reset API" in the Expert UI it might result in having the USB device be recognised under a different name (ttyACM1 while it was ttyACM0 before the restart).
In that case you need to stop the container.
Reattach the USB stick so it's back to ttyACM0.
Start the container again.
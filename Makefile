SERVER_IMAGE = z-way-server-Ubuntu-v2.2.2.tgz

DOCKER_IMAGE_NAME_VERSION = 2.2.2
DOCKER_IMAGE_NAME_BASE = wattx/z-way-server-ubuntu
DOCKER_IMAGE_NAME_FULL = $(DOCKER_IMAGE_NAME_BASE):$(DOCKER_IMAGE_NAME_VERSION)

.PHONY: all build run push shell release

all: run

get-source:
	wget razberry.z-wave.me/z-way-server/$(SERVER_IMAGE)
	tar --strip-components=1 -zxvf $(SERVER_IMAGE)
	rm $(SERVER_IMAGE)

build:
	docker build --build-arg SERVER_IMAGE=$(SERVER_IMAGE) -t $(DOCKER_IMAGE_NAME_FULL) --rm .

run:
	docker run -it --rm --privileged -p 8083:8083 -v $(shell pwd):/home/user/app $(DOCKER_IMAGE_NAME_FULL)

shell:
	docker run -it --rm --privileged -p 8083:8083 -v $(shell pwd):/home/user/app --entrypoint=bash $(DOCKER_IMAGE_NAME_FULL)

push:
	docker push $(DOCKER_IMAGE_NAME_FULL)

release: build push

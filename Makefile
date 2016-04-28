NAME = z-way-server
VERSION = 0.0.1
IMAGE = $(NAME):$(VERSION)


.PHONY: all build run push shell release

all: run

get-source:
	wget razberry.z-wave.me/z-way-server/z-way-server-Ubuntu-v2.2.2.tgz

build:
	docker build -t $(IMAGE) --rm .

run:
	docker run -it --rm --privileged -v $(shell pwd):/home/user/app $(IMAGE)

shell:
	docker run -it --rm --privileged -v $(shell pwd):/home/user/app --entrypoint=bash $(IMAGE)

push:
	docker push $(IMAGE)

release: build push

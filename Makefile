NAME = z-way-server
VERSION = 0.0.1
IMAGE = $(NAME):$(VERSION)

SERVER_IMAGE = z-way-server-Ubuntu-v2.2.2.tgz


.PHONY: all build run push shell release

all: run

get-source:
	wget razberry.z-wave.me/z-way-server/$(SERVER_IMAGE)
	tar --strip-components=1 -zxvf $(SERVER_IMAGE)
	rm $(SERVER_IMAGE)

build:
	docker build -t $(IMAGE) --rm .

run:
	docker run -it --rm --privileged -p 8083:8083 -v $(shell pwd):/home/user/app $(IMAGE)

shell:
	docker run -it --rm --privileged -p 8083:8083 -v $(shell pwd):/home/user/app --entrypoint=bash $(IMAGE)

push:
	docker push $(IMAGE)

release: build push

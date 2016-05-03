FROM ubuntu:14.04

ARG SERVER_IMAGE
RUN apt-get -y update
RUN apt-get -y install libssl-dev libcurl3 libarchive-dev libarchive13 wget

WORKDIR /home/user/app

RUN wget razberry.z-wave.me/z-way-server/${SERVER_IMAGE}
RUN tar --strip-components=1 -zxvf ${SERVER_IMAGE}
RUN rm ${SERVER_IMAGE}

ENV LD_LIBRARY_PATH=/home/user/app/libs


CMD ./z-way-server
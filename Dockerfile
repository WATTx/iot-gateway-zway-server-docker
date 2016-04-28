FROM ubuntu:16.04

RUN apt-get -y update
RUN apt-get -y install libssl-dev libcurl3 libarchive-dev libarchive13

ENV LD_LIBRARY_PATH=/home/user/app/libs


WORKDIR /home/user/app





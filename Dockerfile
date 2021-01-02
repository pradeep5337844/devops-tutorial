# use a node base image
FROM node:7-onbuild

# set maintainer
LABEL maintainer "miiro@getintodevops.com"

RUN apt-get update \
 && apt-get install -y sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

# this is where I was running into problems with the other approaches
RUN sudo apt-get update 

# tell docker what port to expose
EXPOSE 8000

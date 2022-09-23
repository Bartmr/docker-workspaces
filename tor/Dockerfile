FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop


#
#

RUN apt-get update \
	&& apt install -y tor torbrowser-launcher gxmessage


ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID tor && useradd --uid $USER_UID --gid $USER_GID --create-home tor

USER tor

WORKDIR /home/tor


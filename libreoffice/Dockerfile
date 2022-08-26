FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN add-apt-repository ppa:libreoffice && apt-get update && apt-get install -y --no-install-recommends \
	libreoffice

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID libreoffice && useradd --uid $USER_UID --gid $USER_GID --create-home libreoffice

USER libreoffice

WORKDIR /home/libreoffice

CMD [ "libreoffice" ]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN add-apt-repository ppa:libreoffice && apt-get update && apt-get install -y --no-install-recommends \
	libreoffice

RUN groupadd --system libreoffice && useradd --system --uid 999 --gid libreoffice libreoffice \
	&& mkdir -p /home/libreoffice \
	&& chown libreoffice:libreoffice /home/libreoffice

USER libreoffice

WORKDIR /home/libreoffice

CMD [ "libreoffice" ]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	gimp

RUN groupadd -r gimp && useradd -r -g gimp -G audio,video gimp \
	&& mkdir -p /home/gimp \
	&& chown -R gimp:gimp /home/gimp

USER gimp

ENTRYPOINT [ "gimp" ]

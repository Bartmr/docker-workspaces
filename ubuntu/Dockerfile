FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN groupadd -r ubuntu && useradd -r -g ubuntu -G audio,video ubuntu \
	&& mkdir -p /home/ubuntu \
	&& chown ubuntu:ubuntu /home/ubuntu

USER ubuntu

WORKDIR /home/ubuntu

ENV APPIMAGE_EXTRACT_AND_RUN=1

CMD [ "sleep", "infinity" ]

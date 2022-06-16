FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	gtk2-engines-pixbuf gimp

RUN groupadd -r gimp && useradd -r -g gimp -G audio,video gimp \
	&& mkdir -p /home/gimp \
	&& chown gimp:gimp /home/gimp

USER gimp

WORKDIR /home/gimp

CMD [ "gimp" ]

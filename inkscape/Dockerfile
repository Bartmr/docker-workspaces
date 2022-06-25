FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#



RUN add-apt-repository ppa:inkscape.dev/stable && \
	apt-get update && apt-get install -y --no-install-recommends \
	inkscape

RUN groupadd --system inkscape && useradd --system --uid 999 --gid inkscape inkscape \
	&& mkdir -p /home/inkscape \
	&& chown inkscape:inkscape /home/inkscape

USER inkscape

WORKDIR /home/inkscape

CMD [ "inkscape" ]

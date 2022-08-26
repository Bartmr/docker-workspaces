FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#



RUN add-apt-repository ppa:inkscape.dev/stable && \
	apt-get update && apt-get install -y --no-install-recommends \
	inkscape

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID inkscape && useradd --uid $USER_UID --gid $USER_GID --create-home inkscape

USER inkscape

WORKDIR /home/inkscape

CMD [ "inkscape" ]

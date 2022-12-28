FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

RUN apt-get install -y sudo

RUN apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg

RUN apt-get install -y --no-install-recommends \
	xdg-desktop-portal \
	xdg-desktop-portal-gtk \
	libcanberra-gtk-module \
	libcanberra-gtk3-module

RUN apt-get install -y sqlite3 jq

#
# Ubuntu 22 and legacy X11

RUN apt-get install -y dbus-x11

#
#

ARG CACHEBUST
RUN echo "cache bust $CACHEBUST"

RUN apt-get update && apt-get upgrade -y --no-install-recommends

#
#


ARG TZ
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata

#
# UNSAFE CHROME APT REPO STARTS HERE
#

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

RUN apt-get update

RUN apt-get install -y \
	google-chrome-stable \
	--no-install-recommends

RUN apt-get install -y --no-install-recommends \
	fonts-noto fonts-noto-color-emoji

#
#

COPY pulse-client.conf /etc/pulse/client.conf

#
#

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID chrome && useradd --shell /bin/bash --uid $USER_UID --gid $USER_GID --groups audio,video,sudo --create-home chrome
RUN echo "chrome:Mb921" | chpasswd

USER chrome

RUN mkdir -p /home/chrome/chrome-data \
	&& mkdir -p /home/chrome/.local/share/keyrings

WORKDIR /home/chrome

CMD [ "/home/chrome/docker-bin/run-in-docker.sh" ]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

RUN apt-get update

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

ARG CACHEBUST
RUN echo "cache bust $CACHEBUST"

RUN apt-get update && apt-get upgrade -y --no-install-recommends

#
#

COPY pulse-client.conf /etc/pulse/client.conf

ARG TZ
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata

#
#

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID chrome && useradd --uid $USER_UID --gid $USER_GID --groups audio,video,sudo --create-home chrome
RUN echo "chrome:Mb921" | chpasswd

USER chrome

RUN mkdir -p /home/chrome/chrome-data \
	&& mkdir -p /home/chrome/.local/share/keyrings

WORKDIR /home/chrome

CMD [ "/usr/src/app/bin/run-in-docker.sh" ]

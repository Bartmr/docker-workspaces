FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	wget

RUN apt-get install -y xz-utils

RUN wget https://downloads.arduino.cc/arduino-1.8.19-linux64.tar.xz --directory-prefix=/usr/src/app

RUN tar -xf /usr/src/app/arduino-1.8.19-linux64.tar.xz -C /usr/src/app

# RUN /usr/src/app/arduino-1.8.19/arduino-linux-setup.sh
RUN /usr/src/app/arduino-1.8.19/install.sh

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID arduino && useradd  --uid $USER_UID --gid $USER_GID --groups dialout --create-home arduino

USER arduino

WORKDIR /home/arduino

CMD ["arduino"]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID ubuntu && useradd --uid $USER_UID --gid $USER_GID --create-home ubuntu

USER ubuntu

WORKDIR /home/ubuntu

ENV APPIMAGE_EXTRACT_AND_RUN=1

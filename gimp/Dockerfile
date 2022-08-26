FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	gtk2-engines-pixbuf gimp

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID gimp && useradd --uid $USER_UID --gid $USER_GID --create-home gimp

USER gimp

WORKDIR /home/gimp

CMD [ "gimp" ]

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN apt-get update && apt-get install -y --no-install-recommends \
	wget

RUN wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

RUN dpkg -i dbeaver-ce_latest_amd64.deb \
  && rm dbeaver-ce_latest_amd64.deb

RUN apt-get update && apt-get install -y --no-install-recommends \
	postgresql-client

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID dbeaver && useradd --uid $USER_UID --gid $USER_GID --create-home dbeaver

USER dbeaver

WORKDIR /home/dbeaver

CMD [ "dbeaver" ]
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

RUN groupadd --system dbeaver && useradd --system --uid 999 --gid dbeaver dbeaver \
	&& mkdir -p /home/dbeaver \
	&& chown dbeaver:dbeaver /home/dbeaver

USER dbeaver

WORKDIR /home/dbeaver

CMD [ "dbeaver" ]
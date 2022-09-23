FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop


#
#

RUN apt-get update \
	&& apt install -y curl wget gxmessage libdbus-glib-1-2 jq file

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID tor-browser && useradd --uid $USER_UID --gid $USER_GID --create-home tor-browser

USER tor-browser

WORKDIR /home/tor-browser

COPY ./bin/install-tor-browser.sh /home/tor-browser

RUN ./install-tor-browser.sh

COPY ./bin/run-tor-browser.sh /home/tor-browser

CMD ["./run-tor-browser.sh"]

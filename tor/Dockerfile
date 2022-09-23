FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop


#
#

RUN apt-get update \
	&& apt install -y curl wget gxmessage libdbus-glib-1-2 jq

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID tor && useradd --uid $USER_UID --gid $USER_GID --create-home tor

USER tor

WORKDIR /home/tor

COPY ./bin/install-tor.sh /home/tor

RUN ./install-tor.sh

COPY ./bin/run-tor.sh /home/tor

CMD ["./run-tor.sh"]

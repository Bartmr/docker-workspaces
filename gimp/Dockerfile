FROM ubuntu:20.04

# https://github.com/jessfraz/dockerfiles/blob/master/chrome/stable/Dockerfile

ARG TZ
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y --no-install-recommends \
	gimp

RUN groupadd -r gimp && useradd -r -g gimp -G audio,video gimp \
	&& mkdir -p /home/gimp \
	&& chown -R gimp:gimp /home/gimp

USER gimp

ENTRYPOINT [ "gimp" ]

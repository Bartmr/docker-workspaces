FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

COPY Tiled.AppImage /usr/src/app/

RUN chmod +x /usr/src/app/Tiled.AppImage

RUN groupadd -r tiled && useradd -r -g tiled -G audio,video tiled \
	&& mkdir -p /home/tiled \
	&& chown tiled:tiled /home/tiled

USER tiled

WORKDIR /home/tiled

ENV APPIMAGE_EXTRACT_AND_RUN=1

CMD [ "/usr/src/app/Tiled.AppImage" ]

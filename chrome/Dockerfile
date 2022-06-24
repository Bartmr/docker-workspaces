FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

# Install Chrome
RUN apt-get update && apt-get install -y --no-install-recommends \
	apt-transport-https \
	ca-certificates \
	curl \
	gnupg

RUN apt-get update && apt-get install -y --no-install-recommends \
	xdg-desktop-portal \
	xdg-desktop-portal-gtk \
	libcanberra-gtk-module \
	libcanberra-gtk3-module


RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends

COPY pulse-client.conf /etc/pulse/client.conf

# Add chrome user
RUN groupadd --system chrome && useradd --system --uid 999 --gid chrome --groups audio,video chrome \
    && mkdir -p /home/chrome/chrome-data \
		&& mkdir -p /home/chrome/.local/share/keyrings \
    && chown -R chrome:chrome /home/chrome

# Run Chrome as non privileged user
USER chrome

WORKDIR /home/chrome

# Autorun chrome
CMD [ "/usr/src/app/bin/run-in-docker.sh" ]

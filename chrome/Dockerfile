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
	gnupg \
	--no-install-recommends

RUN curl -sSL https://dl.google.com/linux/linux_signing_key.pub | apt-key add - \
	&& echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
	&& apt-get update && apt-get install -y \
	google-chrome-stable \
	--no-install-recommends

# Add chrome user
RUN groupadd -r chrome && useradd --system --gid chrome --groups audio,video chrome \
    && mkdir -p /home/chrome \
    && chown chrome:chrome /home/chrome

# Run Chrome as non privileged user
USER chrome

WORKDIR /home/chrome

RUN mkdir -p /home/chrome/chrome-data

# Autorun chrome
CMD [ "/usr/src/app/bin/run-in-docker.sh" ]

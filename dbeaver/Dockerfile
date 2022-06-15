FROM ubuntu:20.04

# https://github.com/jessfraz/dockerfiles/blob/master/chrome/stable/Dockerfile

ARG TZ
ENV TZ=$TZ
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
	wget libgtk-3-0

RUN wget https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb

RUN dpkg -i dbeaver-ce_latest_amd64.deb \
  && rm dbeaver-ce_latest_amd64.deb

RUN groupadd -r dbeaver && useradd -r -g dbeaver -G audio,video dbeaver \
    && mkdir -p /home/dbeaver \
    && chown -R dbeaver:dbeaver /home/dbeaver

USER dbeaver

CMD [ "dbeaver" ]
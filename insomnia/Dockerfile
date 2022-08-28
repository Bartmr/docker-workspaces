FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

#
#

RUN echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | tee -a /etc/apt/sources.list.d/insomnia.list

RUN apt-get update
RUN apt-get install -y insomnia

#
#

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID insomnia && useradd --uid $USER_UID --gid $USER_GID --create-home insomnia

USER insomnia

WORKDIR /home/insomnia

CMD ["insomnia", "--no-sandbox"]
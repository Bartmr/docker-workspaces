FROM ibmjava:8

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends ubuntu-desktop

RUN apt-get install -y sudo

ARG USER_UID
ARG USER_GID

RUN groupadd --gid $USER_GID java-8 && useradd --uid $USER_UID --gid $USER_GID --groups sudo --create-home java-8

USER java-8

WORKDIR /home/java-8

CMD [ "/bin/bash" ]
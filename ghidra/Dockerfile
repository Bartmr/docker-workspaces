FROM blacktop/ghidra

RUN apt-get update && apt-get install -y sudo

RUN apt install -y openjdk-11-jdk

ARG USER_GID
ARG USER_UID

RUN groupadd --gid $USER_GID ghidra && useradd --uid $USER_UID --gid $USER_GID --groups sudo --create-home ghidra
RUN echo "ghidra:Mb921" | chpasswd

USER ghidra

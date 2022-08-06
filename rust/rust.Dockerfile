FROM ubuntu:kinetic

LABEL MAINTAINER="https://github.com/ThBlitz | PreethamRakshith11@gmail.com"
LABEL VERSION="0.0.0"
LABEL DESCRIPTION="ubuntu:kinetic | Rust >= 1.62.1 (latest)"

RUN apt-get update
RUN apt-get upgrade -y

RUN apt install build-essential -y
RUN apt install zlib1g-dev
RUN apt install libncurses5-dev -y
RUN apt install libgdbm-dev
RUN apt install libnss3-dev -y
RUN apt install libssl-dev
RUN apt install libreadline-dev
RUN apt install libffi-dev
RUN apt install wget -y
RUN apt install curl -y

RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /home
RUN mkdir -p mount
WORKDIR /home/mount

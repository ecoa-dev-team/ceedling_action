FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=nointeractive

RUN apt-get update \
  && apt install -y -q \
  gcc \
  gcovr \
  ruby

RUN gem install ceedling --version ">=1.0"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

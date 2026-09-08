FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install -y -q \
  gcc \
  gcovr \
  ruby \
  ruby-dev \
  build-essential \
  && rm -rf /var/lib/apt/lists/*

RUN gem install erb -v 4.0.4.1
RUN gem install ceedling --version "~> 1.0"

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
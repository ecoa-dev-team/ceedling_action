FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=nointeractive

RUN apt-get update \
  && apt install -y -q \
  gcc \
  gcovr \
  ruby

RUN gem install ceedling -v 0.31.1

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

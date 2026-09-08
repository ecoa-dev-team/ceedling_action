FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=nointeractive

RUN apt-get update \
  && apt install -y -q \
  gcc \
  gcovr \
  ruby
RUN gem install erb -v 4.0.4.1
RUN gem install ceedling 

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

FROM ubuntu:16.04
MAINTAINER eugenewestbrook@gmail.com

RUN apt-get update \
  && apt-get install -y gettext

RUN mkdir /secrets
RUN mkdir /scripts
ADD scripts /scripts

ENV ENCRYPTED_SECRETS_FILE /encrypted/secrets.gpg
ENV KEY_PATH /keys/testing

WORKDIR /scripts
ENTRYPOINT /scripts/entrypoint.sh

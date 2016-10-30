FROM ubuntu:16.04
MAINTAINER eugenewestbrook@gmail.com

RUN apt-get update \
  && apt-get install -y gettext

RUN mkdir /secrets /scripts /home/secrets
ADD scripts /scripts

RUN useradd secrets
RUN chown -R secrets /secrets /scripts /home/secrets
# /home/secrets needed for keyring - easier to just make home dir

ENV ENCRYPTED_SECRETS_FILE /encrypted/secrets.gpg
ENV KEY_PATH /keys/testing

WORKDIR /scripts
USER secrets
ENTRYPOINT /scripts/entrypoint.sh

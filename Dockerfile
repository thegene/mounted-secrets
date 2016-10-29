FROM ubuntu:16.04
MAINTAINER eugenewestbrook@gmail.com

RUN mkdir /secrets
RUN mkdir /scripts
ADD create-secrets.sh import-key.sh /scripts/

ENV ENCRYPTED_SECRETS_FILE /encrypted/secrets.gpg
ENV KEY_PATH /keys/testing
CMD /bin/bash

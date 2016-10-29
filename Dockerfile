FROM ubuntu:16.04
MAINTAINER eugenewestbrook@gmail.com

RUN mkdir /secrets
ADD create-secrets.sh read-secrets.sh /secrets

CMD /bin/bash

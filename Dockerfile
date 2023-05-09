FROM ubuntu:18.04

ARG cypressVersion=3.0.3
ARG nodeVersion=16

COPY ./build.sh /opt/build.sh

ENV DEBIAN_FRONTEND=noninteractive
ENV CYPRESS_INSTALL_BINARY="/opt/cypress/cypress.zip"
ENV CYPRESS_VERSION="$cypressVersion"

RUN bash /opt/build.sh "${cypressVersion}" "${nodeVersion}"

RUN rm /opt/build.sh

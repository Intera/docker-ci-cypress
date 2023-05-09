FROM cypress/base:latest

ARG cypressVersion=3.8.3

COPY ./build.sh /opt/build.sh

ENV DEBIAN_FRONTEND=noninteractive
ENV CYPRESS_INSTALL_BINARY="/opt/cypress/cypress.zip"
ENV CYPRESS_VERSION="$cypressVersion"

RUN bash /opt/build.sh "${cypressVersion}"

RUN rm /opt/build.sh

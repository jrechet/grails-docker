FROM openjdk:8-jdk-alpine
MAINTAINER Michaël van de Giessen <tubbynl@github.com>

# Set Grails version (max version for this Docker image is: 2.5.6).
ENV GRAILS_VERSION 2.5.6

# Install Grails
RUN apk update && \
    apk add ca-certificates wget && \
    update-ca-certificates && \
    wget https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails-$GRAILS_VERSION
ENV PATH $GRAILS_HOME/bin:$PATH

# Set Default Behavior
ENTRYPOINT ["grails"]

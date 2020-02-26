FROM gradle:6.0-jdk11
MAINTAINER Michaël van de Giessen <tubbynl@github.com>

# Set Grails version (default: 4.0.1; min: 3.0.0; max: 4.0.1).
ENV GRAILS_VERSION 4.0.2

WORKDIR /usr/lib/jvm
# Install Grails
RUN wget -q https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip -q grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path.
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

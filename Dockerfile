FROM openjdk:8-alpine
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
EXPOSE 9324

ENV ELASTICMQ_VERSION=0.14.6 \
    ELASTICMQ_SHA256=1f42a90360ed430f4d46a2481eb4c9b9f849e1655426104c7ea73fc366bde2b2

# Download and install the binaries
RUN wget -q -O /elasticmq-server.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  /elasticmq-server.jar" | sha256sum -c -

WORKDIR /elasticmq
RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
USER nobody
ENV ELASTICMQ_OPTS=""
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar

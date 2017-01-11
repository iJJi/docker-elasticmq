FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
EXPOSE 9324

ENV ELASTICMQ_VERSION=0.12.0 \
    ELASTICMQ_SHA256=06c6b5dcf0d2f7efdbbeca466917a0345bc71fbccaf1282e74b14e596cd2b215

# Download and install the binaries
RUN wget -q -O /elasticmq-server.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  /elasticmq-server.jar" | sha256sum -c -

WORKDIR /elasticmq
RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
USER nobody
ENV ELASTICMQ_OPTS=""
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar

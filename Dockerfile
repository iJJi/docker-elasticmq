FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
EXPOSE 9324

ENV ELASTICMQ_VERSION=0.13.2 \
    ELASTICMQ_SHA256=6f038e3eb105c3de3de8a387e4360335e35ab8cc21575749b58eedfd19abe28f

# Download and install the binaries
RUN wget -q -O /elasticmq-server.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  /elasticmq-server.jar" | sha256sum -c -

WORKDIR /elasticmq
RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
USER nobody
ENV ELASTICMQ_OPTS=""
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar

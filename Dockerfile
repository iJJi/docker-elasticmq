FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
EXPOSE 9324

ENV ELASTICMQ_VERSION=0.13.8 \
    ELASTICMQ_SHA256=41525fa141f36145e4bb54211bee0906a1901d1cfcbb0d86b8f4367b521e69e1

# Download and install the binaries
RUN wget -q -O /elasticmq-server.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  /elasticmq-server.jar" | sha256sum -c -

WORKDIR /elasticmq
RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
USER nobody
ENV ELASTICMQ_OPTS=""
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar

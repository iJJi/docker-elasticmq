FROM frolvlad/alpine-oraclejdk8:slim
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
EXPOSE 9324

ENV ELASTICMQ_VERSION=0.11.1 \
    ELASTICMQ_SHA256=d7431f0afb4136654294cfd0a1a2f124751f979c35db976b7f319aa573ada83c

# Download and install the binaries
RUN wget -q -O /elasticmq-server.jar http://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  /elasticmq-server.jar" | sha256sum -c -

WORKDIR /elasticmq
RUN mkdir -p /elasticmq && chown nobody:nobody /elasticmq && chmod 0750 /elasticmq
USER nobody
ENV ELASTICMQ_OPTS=""
CMD exec java ${ELASTICMQ_OPTS} -jar /elasticmq-server.jar

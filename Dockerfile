FROM java:openjdk-8-jre
MAINTAINER Bryan Talbot <bryan.talbot@ijji.com>
ENV ELASTICMQ_VERSION=0.8.12 \
    ELASTICMQ_SHA256=807fb1657f4cde2f4b9373a87c7b30dfa4a590682935f944ac3be78449b33a53
WORKDIR /elasticmq

# Download and install the binaries to WORKDIR
RUN wget -q -O elasticmq-server-${ELASTICMQ_VERSION}.jar https://s3-eu-west-1.amazonaws.com/softwaremill-public/elasticmq-server-${ELASTICMQ_VERSION}.jar && \
    echo "${ELASTICMQ_SHA256}  elasticmq-server-${ELASTICMQ_VERSION}.jar" | sha256sum -c -

ENV ENDPOINT_HOST=127.0.0.1 ENDPOINT_PORT=9324
EXPOSE 9324
CMD exec /usr/bin/java -Dnode-address.host=${ENDPOINT_HOST} -Dnode-address.port=${ENDPOINT_PORT} -jar elasticmq-server-${ELASTICMQ_VERSION}.jar

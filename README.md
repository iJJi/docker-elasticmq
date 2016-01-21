# docker-elasticmq

A docker container for [elasticmq](https://github.com/adamw/elasticmq) which is a nice message queue server with an SQS interface which makes it fantastic for SQS app developers.

It's on [docker-hub](https://hub.docker.com/r/fingershock/elasticmq/) and [github](https://github.com/iJJi/docker-elasticmq)

## tags and links
 * `latest` [(Dockerfile)](https://github.com/ijji/docker-elasticmq/blob/master/Dockerfile) [![](https://badge.imagelayers.io/fingershock/elasticmq:latest.svg)](https://imagelayers.io/?images=fingershock/elasticmq:latest) [![Build Status](https://travis-ci.org/iJJi/docker-elasticmq.svg?branch=master)](https://travis-ci.org/iJJi/docker-elasticmq)
 * `0.8.12` [(Dockerfile)](https://github.com/ijji/docker-elasticmq/blob/0.8.12/Dockerfile) [![](https://badge.imagelayers.io/fingershock/elasticmq:0.8.12.svg)](https://imagelayers.io/?images=fingershock/elasticmq:0.8.12) [![Build Status](https://travis-ci.org/iJJi/docker-elasticmq.svg?branch=0.8.12)](https://travis-ci.org/iJJi/docker-elasticmq)

## running

Running can be as simple as
```sh
docker run -P fingershock/elasticmq
```
however, to be generally useful, additional arguments or configuration files will need to be provided.

To provide an elasticmq configuration file, bind mount it and tell elasticmq where it is using the `ELASTICMQ_OPTS` environment variable.
```sh
docker run -P -e ELASTICMQ_OPTS="-Dconfig.file=my.conf" -v /docker/host/emq/my.conf:/elasticmq/my.conf:ro  fingershock/elasticmq
```


Passing simple options without a full-blown config file can also be done using `ELASTICMQ_OPTS`

```sh
docker run -p 9999:9324 -e ELASTICMQ_OPTS="-Dnode-address.host=10.2.3.4 -Dnode-address.port=9999" fingershock/elasticmq
```


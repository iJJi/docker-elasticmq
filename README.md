# docker-elasticmq

A simple docker container for [elasticmq](https://github.com/adamw/elasticmq)

Two versions available. One built using docker official java base image which is kinda big
FROM java:openjdk-8-jre [![](https://badge.imagelayers.io/fingershock/elasticmq:latest.svg)](https://imagelayers.io/?images=fingershock/elasticmq:latest)

and one built from an alpine linux base image which is much smaller
FROM frolvlad/alpine-oraclejdk8:slim A simple docker container for [elasticmq](https://github.com/adamw/elasticmq) with the service exposed on port 9324


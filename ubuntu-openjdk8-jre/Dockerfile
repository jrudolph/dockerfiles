FROM ubuntu:xenial

MAINTAINER jrudolph

LABEL date=20161016

RUN apt-get update && apt-get install -y openjdk-8-jre-headless ca-certificates-java && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN update-ca-certificates -f

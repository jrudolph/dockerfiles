FROM ubuntu:trusty

MAINTAINER jrudolph

RUN apt-get update && \
    apt-get install -y python-dev libffi-dev libssl-dev python-pip && \
    pip install unittest2 autobahntestsuite && \
    apt-get remove -y python-dev libffi-dev libssl-dev python-pip && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

EXPOSE 8080 9001

WORKDIR /tmp

CMD wstest -m fuzzingserver

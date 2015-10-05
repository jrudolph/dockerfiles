FROM jrudolph/ubuntu-openjdk8-jre

MAINTAINER jrudolph

# Also installs openjdk-7-jre (non-headless) because there's no headless jdk
# see http://serverfault.com/questions/46946/how-can-i-install-a-headless-jdk-on-an-ubuntu-jaunty-server
# and https://bugs.launchpad.net/ubuntu/+source/openjdk-6/+bug/257857
RUN apt-get update && apt-get install --no-install-recommends -y openjdk-8-jdk && apt-get clean && rm -rf /var/lib/apt/lists/*

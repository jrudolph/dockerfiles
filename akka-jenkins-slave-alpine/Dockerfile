FROM adoptopenjdk/openjdk8:alpine-slim

MAINTAINER jrudolph

LABEL date=20190205

RUN apk add openssh && \
    ssh-keygen -A

# Install SBT

RUN wget -O /tmp/sbt.tgz https://piccolo.link/sbt-1.2.8.tgz && \
    cd /opt && \
    tar xf /tmp/sbt.tgz && \
    rm /tmp/sbt.tgz

# Install adoptopenjdk 11 next to the already installed 8 version

RUN wget -O /tmp/openjdk11.tar.gz https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.2%2B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.2_7.tar.gz && \
    cd /opt && \
    tar xf /tmp/openjdk11.tar.gz && \
    mv /opt/jdk-11.0.2+7 /opt/java/openjdk11 && \
    rm /tmp/openjdk11.tar.gz

# Setup ssh access

RUN mkdir -p ~/.ssh/ && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLm0PYAyo7LcGPCN//v0EGnBKUDgQhKol5zTqPNdMliOJrNKjW4++VDXdXY1FjfPbuUwAdllcPQv8y21YKK1z7xrLbL/BC/3SXBlfaZQMahfmLeeYXfwHDY9Qx7xzRB947u/8MjqjpoOqzNO2FJPpqoAj3kE4+smF3CwVh9x9SN5L4iNSF/cEB2RGX/LYNFDwEUOYKRPu28q+K0Sd0bzDhhW4VVFhd0FiJAdX/ocRxjHKsHyAl2/X+9zzyi4FZjgORfPbgSfkIrN9AL5mu2NuzxL4RAkThqDOGvPHqVDrTNONJQ2TkclrRxN/71Ht/v/OOQCxxzq6noZcYjuaDHJdj" > ~/.ssh/authorized_keys

# Setup jenkins workspace

RUN mkdir -p /root/jenkins/workspace

# Bootstrap sbt so that common jar files are preloaded

RUN wget -O /tmp/akka-http.tar.gz https://github.com/akka/akka-http/archive/v10.1.7.tar.gz && \
    cd /tmp && tar xf /tmp/akka-http.tar.gz && \
    cd /tmp/akka-http-10.1.7 && \
    java \
      -Dsbt.ivy.home=/localhome/jenkinsakka/.ivy2 \
      -Dakka.build.M2Dir=/localhome/jenkinsakka/.m2/repository \
      -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 \
      -jar /opt/sbt/bin/sbt-launch.jar update && \
    rm -r /tmp/akka-http.tar.gz /tmp/akka-http-10.1.7

RUN apk add git bash

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

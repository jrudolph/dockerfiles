FROM ubuntu:bionic

MAINTAINER jrudolph

LABEL date=20190205

RUN apt-get update && \
    apt-get install -y software-properties-common gnupg

RUN add-apt-repository --yes ppa:rpardini/adoptopenjdk && \
    echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    apt-get install -y adoptopenjdk-8-installer adoptopenjdk-11-installer sbt ca-certificates-java sudo openssh-server openssh-client openssh-sftp-server && \
    apt-get remove -y software-properties-common gnupg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates -f

RUN mkdir -p /root/.ssh && \
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
      -jar /usr/share/sbt/bin/sbt-launch.jar update && \
    rm -r /tmp/akka-http.tar.gz /tmp/akka-http-10.1.7

RUN mkdir /run/sshd

RUN update-locale LANG=C.UTF-8

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

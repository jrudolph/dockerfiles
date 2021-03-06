FROM ubuntu:focal

MAINTAINER jrudolph

LABEL date=20201103

RUN apt-get update && \
    apt-get install -y software-properties-common gnupg wget

RUN (wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | apt-key add -) && \
    add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/ && \
    echo "deb https://dl.bintray.com/sbt/debian /" > /etc/apt/sources.list.d/sbt.list && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823 && \
    apt-get update && \
    apt-get install -y adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot sbt ca-certificates-java sudo openssh-server openssh-client openssh-sftp-server locales curl python jq && \
    apt-get remove -y software-properties-common gnupg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    update-ca-certificates -f

RUN mkdir -p /root/.ssh && \
    echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLm0PYAyo7LcGPCN//v0EGnBKUDgQhKol5zTqPNdMliOJrNKjW4++VDXdXY1FjfPbuUwAdllcPQv8y21YKK1z7xrLbL/BC/3SXBlfaZQMahfmLeeYXfwHDY9Qx7xzRB947u/8MjqjpoOqzNO2FJPpqoAj3kE4+smF3CwVh9x9SN5L4iNSF/cEB2RGX/LYNFDwEUOYKRPu28q+K0Sd0bzDhhW4VVFhd0FiJAdX/ocRxjHKsHyAl2/X+9zzyi4FZjgORfPbgSfkIrN9AL5mu2NuzxL4RAkThqDOGvPHqVDrTNONJQ2TkclrRxN/71Ht/v/OOQCxxzq6noZcYjuaDHJdj" > ~/.ssh/authorized_keys

RUN update-locale LANG=C.UTF-8

# Setup jenkins workspace

RUN mkdir -p /root/jenkins/workspace

# Bootstrap sbt so that common jar files are preloaded

RUN cd /tmp && \
    git clone https://github.com/akka/akka-http && \
    cd /tmp/akka-http && \
    java \
      -Dsbt.ivy.home=/localhome/jenkinsakka/.ivy2 \
      -Dakka.build.M2Dir=/localhome/jenkinsakka/.m2/repository \
      -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 \
      -jar /usr/share/sbt/bin/sbt-launch.jar update && \
    rm -r /tmp/akka-http

RUN mkdir /run/sshd

EXPOSE 22

CMD ["/usr/sbin/sshd","-D"]

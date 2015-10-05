FROM jrudolph/sbt-launcher:0.13.7

MAINTAINER jrudolph

RUN mkdir -p /tmp/test-project/project  && echo -n "sbt.version=0.13.7" > /tmp/test-project/project/build.properties

WORKDIR /tmp/test-project

RUN sbt

CMD ["sbt"]

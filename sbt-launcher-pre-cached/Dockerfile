FROM jrudolph/sbt-launcher:0.13.8

MAINTAINER jrudolph

RUN mkdir -p /tmp/test-project/project  && echo -n "sbt.version=0.13.8" > /tmp/test-project/project/build.properties

WORKDIR /tmp/test-project

RUN java -jar /sbt-launch.jar

CMD ["java", "-jar", "/sbt-launch.jar"]

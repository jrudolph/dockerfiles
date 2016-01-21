FROM rlister/ruby:2.1.5

MAINTAINER Johannes Rudolph, johannes.rudolph@gmail.com

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update && \
    apt-get install -y \
    ca-certificates

RUN gem install --verbose --no-rdoc --no-ri riemann-tools

RUN gem install --verbose --no-rdoc --no-ri riemann-docker

EXPOSE 4567

ENTRYPOINT [ "riemann-docker" ]
FROM ubuntu:14.04.4

# Set Timezone to UTC
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update System
RUN apt-get update && apt-get upgrade -y

# Install APT deps
RUN apt-get update && apt-get install -y \
  build-essential \
  colordiff \
  curl \
  git \
  python \
  python-demjson \
  realpath \
  unzip \
  wget \
  zip

WORKDIR /tmp

# Install Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

# Install jq
RUN wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 -O /usr/local/bin/jq && \
  chmod ug+x /usr/local/bin/jq

# Install AWS CLI Client
RUN wget "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -O awscli-bundle.zip && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

CMD [ "bash" ]

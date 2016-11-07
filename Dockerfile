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
RUN curl --silent --location https://deb.nodesource.com/setup_6.x | bash - && \
  apt-get install -y nodejs

# Install jq
RUN curl --silent --location --output /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
  chmod ug+x /usr/local/bin/jq

# Install AWS CLI Client
RUN curl --silent --output awscli-bundle.zip "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Install Terraform
RUN curl --silent --output terraform.zip "https://releases.hashicorp.com/terraform/0.7.9/terraform_0.7.9_linux_amd64.zip" && \
  unzip -d /usr/local/bin/ terraform.zip

# Install Packer
RUN curl --silent --output packer.zip "https://releases.hashicorp.com/packer/0.11.0/packer_0.11.0_linux_amd64.zip" && \
  unzip -d /usr/local/bin/ packer.zip

CMD [ "bash" ]

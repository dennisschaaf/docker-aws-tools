FROM alpine:3.5

RUN apk add --no-cache \
  bash \
  coreutils \
  curl \
  git \
  gnupg \
  make \
  ncurses \
  nodejs \
  perl \
  python \
  unzip \
  wget \
  zip

WORKDIR /tmp

# Install jsonlint
RUN curl --silent --location --output jsonlint.tar.gz https://github.com/dmeranda/demjson/archive/release-2.2.4.tar.gz && \
  tar -xvf jsonlint.tar.gz && \
  cd demjson-release-2.2.4 && \
  python setup.py install

# Install colordiff
RUN curl --silent --output colordiff.tar.gz "http://www.colordiff.org/colordiff-1.0.16.tar.gz" && \
  curl --silent --output colordiff.tar.gz.sig "http://www.colordiff.org/colordiff-1.0.16.tar.gz.sig" && \
  curl --silent --output colordiff-author-public-key https://www.sungate.co.uk/gpgkey_2013.txt && \
  gpg --import colordiff-author-public-key && \
  gpg --verify colordiff.tar.gz.sig colordiff.tar.gz && \
  tar -xvf colordiff.tar.gz && \
  cd colordiff-1.0.16 && \
  make install

# Install jq
RUN curl --silent --location --output /usr/local/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && \
  chmod ug+x /usr/local/bin/jq

# Install AWS CLI Client
RUN curl --silent --output awscli-bundle.zip "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" && \
  unzip awscli-bundle.zip && \
  ./awscli-bundle/install -i /usr/local/aws -b /usr/local/bin/aws

# Install Terraform
ENV TERRAFORM_VERSION=0.8.8
RUN curl --silent --output terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
  unzip -d /usr/local/bin/ terraform.zip

# Install Packer
ENV PACKER_VERSION=0.12.3
RUN curl --silent --output packer.zip "https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip" && \
  unzip -d /usr/local/bin/ packer.zip

CMD [ "bash" ]

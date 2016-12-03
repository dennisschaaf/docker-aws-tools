AWS Tools
=========

Just a simple Docker image that includes:
- AWS CLI
- build-essential
- colordiff
- curl
- JQ
- Packer
- python
- python-demjson
- realpath
- shellcheck
- Terraform
- unzip
- wget
- zip



Usage
-----

You'll need to set environment variable for AWS ie AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY.

Updating this image
-------------------

Update the Dockerfile and run `make` to build and publish to Docker Hub under bugcrowd/aws-tools.

FROM ubuntu:20.04

ENV \
 TERRAFORM_VERSION=0.13.2

RUN apt-get update && apt-get install -y \
    ansible \
    curl \
    python3-pip \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN pip3 install docker

RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && mv terraform /usr/local/bin/ \
   && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip


FROM ubuntu:20.04

ENV \
 TERRAFORM_VERSION=0.12.29 \
 TERRAFORM_PROVIDER_ESXI_VERSION=v1.7.0

RUN apt-get update && apt-get install -y \
    ansible \
    curl \
    unzip \
 && rm -rf /var/lib/apt/lists/*

RUN curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
   && mv terraform /usr/local/bin/ \
   && rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -O -L https://github.com/josenk/terraform-provider-esxi/releases/download/${TERRAFORM_PROVIDER_ESXI_VERSION}/terraform-provider-esxi_${TERRAFORM_PROVIDER_ESXI_VERSION} \
   && mv terraform-provider-esxi_${TERRAFORM_PROVIDER_ESXI_VERSION} /usr/local/bin \
   && chmod 755 /usr/local/bin/terraform-provider-esxi_${TERRAFORM_PROVIDER_ESXI_VERSION}


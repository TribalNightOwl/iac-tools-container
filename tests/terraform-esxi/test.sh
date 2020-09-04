#!/bin/bash
set -e
read -s -p "Enter password for your ESXi server: " TF_VAR_esxi_password

docker run --rm --user $(id -u):$(id -g) -v $(pwd):/files --workdir /files tribrhy/iactools:latest terraform init
docker run --rm --user $(id -u):$(id -g) -v $(pwd):/files --workdir /files -e TF_VAR_esxi_password=${TF_VAR_esxi_password} tribrhy/iactools:latest terraform plan
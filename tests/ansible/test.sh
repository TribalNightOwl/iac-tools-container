#!/bin/bash
set -e

function docker_run {
    docker run --rm -v $(pwd):/files -v /var/run/docker.sock:/var/run/docker.sock --workdir $1 tribrhy/iactools:2.1 $2
}

docker_run /files "ansible-playbook /files/nginx-container-start.yaml"

docker ps

read -p "Press <ENTER> to continue" CONTINUE

docker_run /files "ansible-playbook /files/nginx-container-stop.yaml"

docker ps

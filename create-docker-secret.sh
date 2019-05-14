#!/bin/bash
kubectl create secret docker-registry regcred --docker-server=https://index.docker.io/v1/ --docker-username=${DOCKER_USER} --docker-password=${DOCKER_PWD}  --docker-email=${DOCKER_EMAIL}

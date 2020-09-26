#!/bin/bash

CONSUL_HOST="consul"
CONSUL_PORT="8500"

MONGODB_HOST="mongodb"
MONGODB_PORT="27017"
MONGODB_DATABASE="kladrdb"

GATEWAY_HOST="gateway"
GATEWAY_PORT="8080"

DADATA_HOST="dadata"
DADATA_PORT="8080"

NOT_DADATA_HOST="not-dadata"
NOT_DADATA_PORT="8080"

NETWORK_NAME_KLADR="kladr-network"

sudo docker rm --force \
  ${CONSUL_HOST} \
  ${MONGODB_HOST} \
  ${GATEWAY_HOST} \
  ${DADATA_HOST} \
  ${NOT_DADATA_HOST}

sudo docker network rm ${NETWORK_NAME_KLADR}
sudo docker network create ${NETWORK_NAME_KLADR}

sudo docker run -d \
  --net ${NETWORK_NAME_KLADR} \
  --name ${CONSUL_HOST} \
  consul agent -server -bootstrap -ui -client=0.0.0.0

sudo docker run -d \
  --net ${NETWORK_NAME_KLADR} \
  --name ${MONGODB_HOST} \
  mongo

sudo docker run -d \
  --net ${NETWORK_NAME_KLADR} \
  --name ${GATEWAY_HOST} \
  -p 80:${GATEWAY_PORT} \
  -e APP_PORT=${GATEWAY_PORT} \
  -e CONSUL_HOST=${CONSUL_HOST} \
  -e CONSUL_PORT=${CONSUL_PORT} \
  -e DADATA_HOST=${DADATA_HOST} \
  -e DADATA_PORT=${DADATA_PORT} \
  -e NOT_DADATA_HOST=${NOT_DADATA_HOST} \
  -e NOT_DADATA_PORT=${NOT_DADATA_PORT} \
  kladr-services:gateway

sudo docker run -d \
  --net ${NETWORK_NAME_KLADR} \
  --name ${DADATA_HOST} \
  -e APP_HOST=${DADATA_HOST} \
  -e APP_PORT=${DADATA_PORT} \
  -e CONSUL_HOST=${CONSUL_HOST} \
  -e CONSUL_PORT=${CONSUL_PORT} \
  -e API_KEY=${API_KEY} \
  -e SECRET_KEY=${SECRET_KEY} \
  kladr-services:dadata

sudo docker run -d \
  --net ${NETWORK_NAME_KLADR} \
  --name ${NOT_DADATA_HOST} \
  -e APP_HOST=${NOT_DADATA_HOST} \
  -e APP_PORT=${NOT_DADATA_PORT} \
  -e CONSUL_HOST=${CONSUL_HOST} \
  -e CONSUL_PORT=${CONSUL_PORT} \
  -e MONGODB_HOST=${MONGODB_HOST} \
  -e MONGODB_PORT=${MONGODB_PORT} \
  -e MONGODB_DATABASE=${MONGODB_DATABASE} \
  kladr-services:not-dadata

echo "http://localhost:80/"
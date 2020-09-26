#!/bin/bash
cd dadata && mvn clean package && cd ..
cd not-dadata && mvn clean package && cd ..
cd gateway && mvn clean package && cd ..

rm -R target/
mkdir target

sudo docker rmi \
  kladr-services:dadata \
  kladr-services:not-dadata \
  kladr-services:gateway

cp -r src/docker/* target/

mkdir target/dadata/copy
mkdir target/not-dadata/copy
mkdir target/gateway/copy

cp dadata/target/dadata-1.0.jar target/dadata/copy
cp not-dadata/target/not-dadata-1.0.jar target/not-dadata/copy
cp gateway/target/gateway-1.0.jar target/gateway/copy

cd target/dadata
sudo docker build -t kladr-services:dadata . && cd ../..

cd target/not-dadata
sudo docker build -t kladr-services:not-dadata . && cd ../..

cd target/gateway
sudo docker build -t kladr-services:gateway . && cd ../..
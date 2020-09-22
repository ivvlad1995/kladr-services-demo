#!/bin/bash
cd dadata && mvn clean package && cd ..
cd not-dadata && mvn clean package && cd ..
cd gateway && mvn clean package && cd ..

rm -R target/
mkdir target

cp -r src/docker/* target/
cp dadata/target/dadata-1.0.jar target/dadata/copy
cp not-dadata/target/not-dadata-1.0.jar target/not-dadata/copy
cp gateway/target/gateway-1.0.jar target/gateway/copy
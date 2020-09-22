#!/bin/bash
cd dadata && mvn clean package && cd ..
cd not-dadata && mvn clean package && cd ..
cd gateway && mvn clean package && cd ..
rm -R target/
cp dadata/target/dadata-1.0.jar target/
cp not-dadata/target/not-dadata-1.0.jar target/
cp gateway/target/gateway-1.0.jar target/

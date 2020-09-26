### Instructions for deploying a project for Linux.

***
To start correctly, you need preinstalled programs, such as:
1. sudo
2. maven (mvn)
3. docker

***
Build *.jar projects and docker images:
1. In a Linux terminal: ./build.sh

***
### Warning!!! Need free port "80" or change the "EXT_PORT" variable to any other port in run.sh.
***
Services launch:
1. Register and get keys at https://dadata.ru/
2. You need to export your keys from 
the service https://dadata.ru/. 
3. In a Linux terminal:
export API_KEY="your api key" && export SECRET_KEY="your secret key".
4. In a Linux terminal: ./run.sh

***
### In the examples we use the standard port 80. If you change "EXT_PORT" you will have to specify your port.
***
After launch:
1. Visit consul: http://localhost:80/
2. Wait for the launch of the kladr-services.

***
### After launch kladr-services.
***
How use https://dadata.ru/ kladr-service:
1. http://localhost:80/dadata/{address}
2. Example, in the browser line: "http://localhost:80/dadata/Саратов Московская"

***
How use NOT-DATA kladr-service:
1. First, let's add our address to the database. http://localhost:80/not-dadata/add/{address}
2. Example, in the browser line: "http://localhost:80/not-dadata/add/Саратов Московская"
3. Let's find our address now: "http://localhost:80/not-dadata/{address}"
4. Example, in the browser line: "http://localhost:80/not-dadata/Саратов Московская"
***

# Edited on September 26, 2020
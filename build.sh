#!/bin/bash

sudo docker stop abyssal
sudo docker container rm abyssal
sudo docker image rm abyssal

sudo docker build -t abyssal .
#sudo docker run -it -h abyssal --publish 2222:22 --name abyssal abyssal

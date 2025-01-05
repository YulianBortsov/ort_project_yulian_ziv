#!/bin/bash
# Installing docker on amazon-linux instance
yum install docker -y
systemctl enable --now docker
usermod -a -G docker ec2-user
newgrp docker
export PATH=$PATH:/usr/local/bin

# Creating docker network called 'netflix'
docker network create netflix

# Pulling the images
docker pull yulianbortsov/backend
docker pull yulianbortsov/frontend

# Running the containers
docker run --name catalog -p 8080:8080 --network netflix -d yulianbortsov/backend
docker run --name front -p 3000:3000 --network netflix -e MOVIE_CATALOG_SERVICE=http://catalog:8080 -d yulianbortsov/frontend
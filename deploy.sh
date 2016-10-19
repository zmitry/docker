#!/bin/bash
COMPOSER="/home/ubuntu/docker"
rm -r $COMPOSER/dotnet/core

mkdir $COMPOSER/dotnet/core_save

docker-compose --file $COMPOSER stop web

unzip   $COMPOSER/$1  -d   $COMPOSER/dotnet/core/

docker-compose --file $COMPOSER/docker-compose.yml up -d  --build web

rm -r $COMPOSER/dotnet/core

rm $COMPOSER/*.zip

echo "Build Success 'KS:Deploy latest GIT live build to server http://52.57.98.196/ ' started by On Repository Change" | sudo /home/ubuntu/docker/notify.sh

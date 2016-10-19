#!/bin/bash
COMPOSER="/home/ubuntu/docker"
rm -r $COMPOSER/dotnet/core

mkdir $COMPOSER/dotnet/core_save

docker-compose --file $COMPOSER  up web-test --build

unzip   $COMPOSER/$1  -d   $COMPOSER/dotnet/core/

docker-compose --file $COMPOSER/docker-compose.yml up -d  --build web

rm -r $COMPOSER/dotnet/core

rm $COMPOSER/*.zip

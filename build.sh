#!/usr/bin/env bash

if [[ -z "$1" ]]
 then
   echo "You need to provide <docker_username>/<repo_name>. Example: ./build.sh huseyinbabal/api1"
   exit
fi

docker build -t $1 .
docker tag $1 localhost:5000/$1
docker push localhost:5000/$1
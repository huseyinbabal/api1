#!/usr/bin/env bash

if [[ -z "$1" ]]
 then
   echo "You need to provide <docker_username>/<repo_name>. Example: ./build.sh huseyinbabal/api1"
   exit
fi

docker build -t $1 .
docker tag $1 $1
docker push $1
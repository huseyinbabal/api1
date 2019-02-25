#!/usr/bin/env bash

if [[ -z "$1" ]]
 then
   echo "You need to provide <docker_username>/<repo_name>. Example: ./build.sh huseyinbabal/api1"
   exit
fi

image_url=$1

sed -e "s~<image_url>~${image_url}~g" k8s-template.yaml > k8s.yaml

kubectl apply -f k8s.yaml
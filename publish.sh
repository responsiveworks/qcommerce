#!/bin/bash

. ./build.sh

echo "Publishing qcommerce [v$version]..."

docker tag qcommerce:$version registry.digitalocean.com/responsiveworks/qcommerce:$version
docker tag qcommerce:$version registry.digitalocean.com/responsiveworks/qcommerce:latest
docker image push registry.digitalocean.com/responsiveworks/qcommerce:$version
docker image push registry.digitalocean.com/responsiveworks/qcommerce:latest

echo "Publish complete."

#!/bin/bash

set -e
time=$(date '+%H%M')

describe=`git describe --tags`
tag=`echo $describe | cut -d "-" -f 1`
commits=`git rev-list $tag.. --count`
changes=`git status --short | wc -l`
version="${tag/v/}.${commits}"

if [ $changes != "0" ]; then
    version=$version-$time
fi

echo "Building qcommerce [v$version]..."
echo "Generating docker image..."

docker build -t qcommerce:$version .

echo "Build complete."

#!/bin/bash

set -xeuo pipefail

PYLINT_VERSION=2.14.3

BUILDER=$(docker buildx create --use)

docker buildx build \
	--platform linux/amd64,linux/arm/v7 \
	--build-arg pylint_version=$PYLINT_VERSION \
	-t dougrichardson/pylint:$PYLINT_VERSION \
	--push .

docker buildx rm $BUILDER

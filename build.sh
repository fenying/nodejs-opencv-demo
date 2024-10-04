#!/usr/bin/env bash
SCRIPT_ROOT=$(cd $(dirname $0); pwd)

cd $SCRIPT_ROOT

if [[ -z "$NODE_IMAGE_VERSION" ]]; then
    export NODE_IMAGE_VERSION=20.17.0
else
    export NODE_IMAGE_VERSION=$NODE_IMAGE_VERSION
fi

if [[ -z "$OPENCV_VERSION" ]]; then
    export OPENCV_VERSION=4.10.0
else
    export OPENCV_VERSION=$OPENCV_VERSION
fi

docker run \
    -it \
    --rm \
    -e https_proxy=$https_proxy \
    -e http_proxy=$http_proxy \
    --network host \
    -v$SCRIPT_ROOT:/data \
    -w/data \
    fenying/node:$NODE_IMAGE_VERSION-alpine-opencv-$OPENCV_VERSION \
    /data/build-inside-docker.sh

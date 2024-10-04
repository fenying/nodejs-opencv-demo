#!/usr/bin/env sh
SCRIPT_ROOT=$(cd $(dirname $0); pwd)

cd $SCRIPT_ROOT

apk add --no-cache --virtual .build-dependencies python3 build-base &&
    npm ci && \
    rm -rf build && \
    npx node-gyp configure && \
    npx node-gyp build && \
    cp build/Release/image.node . && \
    rm -rf build node_modules && \
    apk del .build-dependencies

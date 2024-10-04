# DEMO: Using OpenCV In Node.js

## Introduction

Here is an example for using OpenCV in Node.js, insides docker container.

## Usage

1. Build NodeJS Addon

    Here we use a prebuilt docker image to build the NodeJS addon.

    ```bash
    ./build.sh
    ```

    This script will use [`fenying/node:20.17.0-alpine-opencv-4.10.0`](https://hub.docker.com/r/fenying/node) to build the NodeJS addon.

    And the build result is the `image.node`, which provides an API `get_image_size` to get the size of an image.

2. Run the demo

    ```bash
    ./run.sh
    ```

    This script will use prebuilt docker image `fenying/node:20.17.0-alpine-opencv-4.10.0` to execute `test.js`.

## LICENSE

MIT

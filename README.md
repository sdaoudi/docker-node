# Node.js Docker image #

[![Build Status](https://travis-ci.org/sdaoudi/docker-node.svg?branch=master)](https://travis-ci.org/sdaoudi/docker-node)

A minimal Dockerfile based on Node.js alpine docker
image.

## What's included ##

- Node.js v8
- npm v6

## Usage examples ##

Node.js 8 example:

    $ docker run --rm -ti sdaoudi/node:8-alpine node -v

## Working directory ##

You can use ``/srv`` as a working directory:

	$ docker run --rm -ti -v $(pwd):/srv sdaoudi/node:8-alpine ls -laF

## Build command ##

You can build a node image with this command:

    $ make build NODE_VERSION=8

# Node.js Docker image #

[![Build Status](https://travis-ci.org/sdaoudi/docker-node.svg?branch=master)](https://travis-ci.org/sdaoudi/docker-node)

A minimal Dockerfile based on Node.js alpine docker
image.

## What's included ##

- Node.js v8
- npm v6

## Usage examples ##

Node.js 8 example:

    $ docker run --rm -ti sdaoudi/node:8 node -v

## Working directory ##

You can use ``/src`` as a working directory:

	$ docker run --rm -ti -v $(pwd):/src sdaoudi/node:8 ls -laF

## Default user ##

This docker image uses ``node`` as default user:

	$ docker run --rm -ti sdaoudi/node:8 whoami

## Build command ##

You can build a node image with this command:

```
$ make build NODE_VERSION=8
```
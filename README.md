# Node.js Docker image #

A minimal Dockerfile based on Node.js alpine docker
image.

## What's included ##

- Node.js v8 and v10
- npm v6

## Usage examples ##

Node.js 10 example:

    $ docker run --rm -ti sdaoudi/node:10 node -v

Node.js 8 example:

    $ docker run --rm -ti sdaoudi/node:8 node -v

## Working directory ##

You can use ``/src`` as a working directory:

	$ docker run --rm -ti -v $(pwd):/src sdaoudi/node:8 ls -laF

## Default user ##

We use ``node`` as default user of this image:

	$ docker run --rm -ti sdaoudi/node:10 whoami

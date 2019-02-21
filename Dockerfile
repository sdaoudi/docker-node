ARG NODE_VERSION=8
FROM node:${NODE_VERSION}-alpine

MAINTAINER DAOUDI Soufian <soufian.daoudi2@gmail.com>

ARG HTTP_PROXY=""
ARG HTTPS_PROXY=""
ARG NO_PROXY=""

ENV HTTP_PROXY  $HTTP_PROXY
ENV HTTPS_PROXY $HTTPS_PROXY
ENV NO_PROXY    $NO_PROXY

ENV NPM_CONFIG_PREFIX   /home/node/.npm-global
ENV PATH                $NPM_CONFIG_PREFIX/bin:$PATH

USER node

RUN mkdir /home/node/.npm-global \
	&& chown -R node:node /home/node/.npm-global \
    && npm install --quiet --no-progress -g \
    	gulp-cli \
        tput

WORKDIR /src

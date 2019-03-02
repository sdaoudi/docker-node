ARG NODE_VERSION=8
FROM node:${NODE_VERSION}-alpine

MAINTAINER DAOUDI Soufian <soufian.daoudi2@gmail.com>

USER root

RUN apk add --no-cache --virtual \
        .gyp \
        python \
        make \
        g++ \
        ncurses-dev \
        su-exec \
        && rm -rf /var/cache/apk/*

RUN npm -g config set user root\
    && npm install --quiet --no-progress -g \
    	gulp-cli \
        tput \
        node-tput \
    && npm cache clean --force

WORKDIR /srv

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["sh", "/entrypoint.sh"]

#!/bin/sh

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

if [ $uid == 0 ] && [ $gid == 0 ]; then
    if [ $# -eq 0 ]; then
        sleep 9999d
    else
        exec "$@"
    fi
fi

if [ $# -eq 0 ]; then
    sleep 9999d
else
    exec su-exec node "$@"
fi

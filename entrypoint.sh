#!/bin/sh

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

if [ $uid == 0 ] && [ $gid == 0 ]; then
    if [ $# -eq 0 ]; then
        npm
    else
        exec "$@"
    fi
else
    sed -i -r "s/node:x:\d+:\d+:/node:x:$uid:$gid:/g" /etc/passwd
    sed -i -r "s/node:x:\d+:/node:x:$gid:/g" /etc/group
    chown $uid:$gid /srv

    user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
    if [ $# -eq 0 ]; then
        npm
    else
        exec su-exec $user "$@"
    fi
fi

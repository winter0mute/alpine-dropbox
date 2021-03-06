#!/bin/sh

# This script is to create a new user with the given user and group ID and run the specified command as him.

UID=${UID:-1000}
GID=${GID:-1000}

addgroup -g $GID dbox && \
        adduser -S -D -H -h /dbox -s /bin/sh -u $UID -G dbox dbox

chown -R $UID:$GID /dbox

su -s /bin/sh -c "$@" dbox

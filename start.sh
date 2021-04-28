#!/bin/bash
set -e

exec $(which memcached) -u ${MEMCACHED_USER} -vp 11211 ${EXTRA_ARGS}
exec $(which sshd) -D


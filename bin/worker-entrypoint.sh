#!/bin/bash

set -e

pushd /usr/local/code/faasm >> /dev/null

echo "Setting up cgroup"
./bin/cgroup.sh

echo "Setting up namespaces"
./bin/netns.sh ${THREADS_PER_WORKER}

popd >> /dev/null

# Continue with normal command
exec "$@"
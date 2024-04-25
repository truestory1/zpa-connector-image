#!/usr/bin/env bash

set -e

chown -R zscaler /opt/zscaler
if [ ! -f "/opt/zscaler/var/provision_key" ]; then
    echo "Adding provisioning key from environment"
    echo ${ZPA_PROVISION_KEY} > /opt/zscaler/var/provision_key
fi

cd /opt/zscaler/var

ulimit -n 512000
arch=$(uname -m)

if [ "$arch" == 'aarch64' ] || [ ! -z "$LIMITED_MEM" ];
then
    exec /opt/zscaler/bin/zpa-connector -memory_arena_count 1 -container "$@"
else
    exec /opt/zscaler/bin/zpa-connector -container "$@"
fi

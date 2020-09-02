#!/bin/bash

# Ensure folders required by munin exist
mkdir -p /run/munin
mkdir -p /var/lib/munin/spool
mkdir -p /var/log/munin

# Link plugins
rm -f /etc/munin/plugins/*
PLUGINS=${PLUGINS:-}
for PLUGIN in $PLUGINS; do
    echo "Adding plugin $PLUGIN"
    FROM=$(echo "$PLUGIN" | cut -d ":" -f1)
    TO=$(echo "$PLUGIN" | cut -d ":" -f2)

    ln -s "/usr/lib/munin/plugins/$FROM" "/etc/munin/plugins/$TO"
done

/usr/sbin/munin-node

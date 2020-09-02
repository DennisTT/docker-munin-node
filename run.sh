#!/bin/bash

# Ensure folders required by munin exist
echo "Creating folders"
mkdir -p /run/munin
mkdir -p /var/lib/munin/spool
mkdir -p /var/log/munin

# Auto link plugins
echo "Automatically activating plugins using munin-node-configure"
rm -f /etc/munin/plugins/*
/usr/sbin/munin-node-configure --suggest --shell | bash

# Link other plugins
PLUGINS=${PLUGINS:-}
for PLUGIN in $PLUGINS; do
    echo "Adding plugin $PLUGIN"
    FROM=$(echo "$PLUGIN" | cut -d ":" -f1)
    TO=$(echo "$PLUGIN" | cut -d ":" -f2)

    ln -s "/usr/lib/munin/plugins/$FROM" "/etc/munin/plugins/$TO"
done

echo "Plugins enabled:"
echo $(ls /etc/munin/plugins)

/usr/sbin/munin-node

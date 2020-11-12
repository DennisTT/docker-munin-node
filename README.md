# Docker Munin Node

This is a simple image that runs Munin node on a Ubuntu base.

## Run
```
docker run -e "PLUGINS=cpu load" dennistt/munin-node:latest
```

### Environment Variables
<table>
    <tr>
        <td><code>PLUGINS</code></td>
        <td>
            <p><code>munin-node-configure</code> is run at the beginning of container execution which should activate most applicable plugins.  To force any additional plugins to be activated, use this environment variable with a space separated list of plugins to activate.  Use a colon if the linked name should be different from the plugin file. Example:</p>
            <code>if_:if_eth0</code>
        </td>
    </tr>
</table>
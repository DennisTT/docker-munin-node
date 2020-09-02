# Docker Munin Node

This is a simple image that runs Munin node on an Alpine base.

## Run
```
docker run -e "PLUGINS=cpu load" dennistt/munin-node:latest
```
### Environment Variables
<table>
    <tr>
        <td><code>PLUGINS</code></td>
        <td>Space separated list of plugins to activate</td>
    </tr>
</table>

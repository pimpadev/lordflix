# 🐳 Keep containers from being up if they are not mounted

At some point you will want to start docker containers only if the hdd is already mounted. For that the file `docker.service` can be modified:

```bash
sudo nano /lib/systemd/system/docker.service
```

In this file you need to add the next parameter:

```bash
RequiresMountsFor=/mnt/ext-hdd
```

With this configuration docker will wait for the exposed hdd before start. If the hdd is not found at the system, docker containers won't start.
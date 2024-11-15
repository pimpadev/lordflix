# Update Docker via compose

Instructions for updating the versions of the services used.

## Update images

First we have to pull the new versions of the images we want to use:

### All images

```bash
docker compose pull
```

### Specific images

```bash
docker compose pull jellyfin
```

## Update containers

Next we must update the containers we are using with the versions we have just downloaded.

### All containers

```bash
docker compose up -d --no-deps --remove-orphans
```

### Specific containers

```bash
docker compose up -d --no-deps --remove-orphans jellyfin
```

## Remove old images

Finally we will delete the old images.

```bash
docker image prune
```

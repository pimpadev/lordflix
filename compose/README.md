# Standard Setup

If you've made it this far, it means the hard part is done. What remains to be done is to set up the services that will run the media center and configure them. Let's do it!

## Prepare the .env file

Copy the `.env.example` file to `.env` and edit it to your liking.

```bash
cp lordflix/compose/.env.example lordflix/compose/.env
```

## Run the services

```bash
cd lordflix/compose/
sudo docker compose up -d
```

## Setup _qBittorrent_ account

- [qBittorrent]()

## Setup _-arr_ services

1.  [Radarr]()
2.  [Prowlarr]()

## Setup _Jellyfin_ server

- [Jellyfin]()

# 🎞️ LordFlix - Media Center

LordFlix is a multimedia center that automatically downloads and serves the latest movies and/or series of the moment. It acts similar to Netflix, Prime Video etc. but hosted from your home. In addition, with proper configuration you can access the content from anywhere in the world.

This guide is prepared to set up a media center from the beginning. Including the basic hardware requirements, going through the server configuration and finally configuring the -arr software that will run the media center.

## ⚙️ Hardware

A complete kit including case, power supply and micro sd card is recommended. In addition, an internal hard disk will be added to store the contents of the media server.

### Recommended

 - [Raspberry PI5 8GB](https://amzn.to/4hq9mRN)
 - [HDD 3.5 4TB](https://amzn.to/4dSOcIV)
 - [3.5-inch HDD Enclosure](https://amzn.to/4fbvoWc)

### Cheaper
 
 - [Raspberry PI4 4GB](https://amzn.to/3Yuo6rf)
 - [HDD 3.5 4TB](https://amzn.to/3BNyQIr)
 - [3.5-inch HDD Enclosure](https://amzn.to/48aRshz)

## 💻 Software

In this tutorial we will install the **Raspberry Pi OS Lite** *(headless)* version. In the following link you will find the installer needed to prepare the operating system in the micro sd.

  - [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/)

  *You need [help](guides/installing-os.md)?*

### Basic configuration

Access the server to perform the following configurations.

*You need [help](guides/connect-via-ssh.md)?*

  - [Configure SWAP Memory](guides/configure-swap.md)
  - [Setup external HDD](guides/setup-ext-hdd.md)
  - Setup Docker

## 🏃‍♂️‍➡️ How to run

- [Default setup](docker-compose/README.md)
  - [With VPN](docker-compose/vpn/README.md) 

## 🚦 Local Access

### Server

```bash
ssh aferbor@aferbor.local
```

### Services

- Jellyfin: http://aferbor.local:8096
  - login: admin
  - password: admin
- Prowlarr: http://aferbor.local:9696
  - login: aferbor
  - password: \*\*\*\*\*\*\*\*
- Radarr: http://aferbor.local:7878
  - login: aferbor
  - password: \*\*\*\*\*\*\*\*
- qBittorrent: http://aferbor.local:8080
  - login: aferbor
  - password: \*\*\*\*\*\*\*\*

## 🐳 Docker

### Docker installation

1. Run the following command to uninstall all conflicting packages: 

```bash
for pkg in docker.io docker-doc docker-compose podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

2. Set up Docker's apt repository.
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

3. Install the Docker packages.

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

4. Verify installation.

```bash
sudo docker run hello-world
```

### Docker-Compose Commands

- `sudo docker compose up -d` (This Docker-compose command helps builds the image, then creates and starts Docker containers. The containers are from the services specified in the compose file. If the containers are already running and you run docker-compose up, it recreates the container.)

- `sudo docker compose pull` (Pulls an image associated with a service defined in a docker-compose.yml)

- `sudo docker compose down` (The Docker-compose down command also stops Docker containers like the stop command does. But it goes the extra mile. Docker-compose down, doesn’t just stop the containers, it also removes them.)

- `sudo docker stats` (This command allows you to check in real time the consumption of the containers)

- `sudo docker logs <containerName>` (See logs of the selected container. Use `-f` if you want to see them in real time)

- `sudo docker system prune -a --volumes --force` (Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.)

### Docker permissions

After run the containers and create the proper folders, we need to run the next commands to give the proper permissions to the folders.

```bash
sudo chown -R $USER:$USER /mnt/ext-hdd
sudo chmod -R a=,a+rX,u+w,g+w /mnt/ext-hdd
```

## Private trackers with access
 - [Torrenteros](https://torrenteros.org/) (Spanish)
 - [ReelFliX](https://reelflix.xyz/) (English)
 - [DigitalCore](https://digitalcore.club/) (English)
 - [HDZero](https://hdzero.org/) (Spanish)

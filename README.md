# LordFlix - Media Center
<div align="center">
 <img src="assets/portada.jpg" alt="Descripción de la imagen" height="500" />
</div>

## 🎞️ LordFlix
**LordFlix** is a multimedia center that automatically downloads and serves the latest movies and/or series of the moment. It acts similar to *Netflix*, *Prime Video* etc. but hosted from your **home**. In addition, with proper configuration you can access the content **from anywhere in the world**.

This guide is prepared to set up a media center from the beginning. Including the basic hardware requirements, going through the server configuration and finally configuring the *-arr* software that will run the media center.

It may seem that the execution of this tutorial is somewhat complex, but everything is properly documented so that anyone can do it. Cheer up!

## ⚙️ Hardware

A complete kit including case, power supply and micro sd card is recommended. In addition, an internal hard disk will be added to store the contents of the media server.

### Recommended

 - [Raspberry PI5 8GB](https://amzn.to/4hq9mRN)
 - [HDD 3.5 4TB](https://amzn.to/4dSOcIV)
 - [3.5-inch HDD Enclosure](https://amzn.to/4fbvoWc)

### Cheaper version
 
 - [Raspberry PI4 4GB](https://amzn.to/3Yuo6rf)
 - [HDD 3.5 4TB](https://amzn.to/3BNyQIr)
 - [3.5-inch HDD Enclosure](https://amzn.to/48aRshz)

**Any unused raspberry you have at home along with any external hard drive lost in a drawer can work in this tutorial. I highly recommend that you have at least 2GB of RAM and 3TB of disk space.*

## 💻 Software

In this tutorial we will install the **Raspberry Pi OS Lite** *(headless)* version. In the following link you will find the installer needed to prepare the operating system in the micro sd.

  - [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/)

  *You need [help](guides/installing-os.md)?*

### Basic configuration

Access the server to perform the following configurations.

*You need [help](guides/connect-via-ssh.md)?*

  - [Configure SWAP Memory](guides/configure-swap.md)
  - [Setup external HDD](guides/setup-ext-hdd.md)
  - [Setup Docker](guides/setup-docker.md)
  - [Setup maintenance scripts](scripts/README.md)

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

## Private trackers with access
 - [Torrenteros](https://torrenteros.org/) (Spanish)
 - [ReelFliX](https://reelflix.xyz/) (English)
 - [DigitalCore](https://digitalcore.club/) (English)
 - [HDZero](https://hdzero.org/) (Spanish)

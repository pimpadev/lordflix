# 🎬 Media Center

This guide was created for manage a media center inside a Raspberry Pi. The OS used is **Raspberry Pi OS Lite** *(headless)*.

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

## 🧠 Configure SWAP memory

This is a guide to prepare the SWAP memory for the Raspberry Pi. That will gonna help to improve the performance of the media center.

### Create SWAP file

Open the terminal and run the next command:

```bash
sudo swapoff /swapfile
sudo rm /swapfile
sudo fallocate -2 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
```

### Activate SWAP memory

Run the next command:

```bash
sudo swapon /swapfile
```

### Persist changes editing `/etc/fstab` file

Run the next command:

```bash
sudo nano /etc/fstab
```

Add this line to the file:

```bash
/swapfile swap swap defaults 0 0
```

### Reboot and verify

Run the next command:

```bash
sudo reboot
```

```bash
free -h
```


## 💾 Prepare external hdd

This is a guide to prepare the external hdd for the media center.

### Identify the external hdd

Open the terminal and run the next command:

```bash
lsblk
```

The output should be similar to this:

```bash
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 931.5G  0 disk
├─sda1   8:1    0   512M  0 part /boot/firmware
├─sda2   8:2    0     1G  0 part /boot
├─sda3   8:3    0   1.8G  0 part
│ ├─fedora-root 253:0    0   1.8G  0 lvm  /
│ └─fedora-swap 253:1    0     4G  0 lvm  [SWAP]
└─sda4   8:4    0 931.5G  0 part /media/fedora
```

In this example, the external hdd is `/dev/sda`.

### Format the external hdd

Run the next command:

```bash
sudo mkfs.ext4 /dev/sda
```

### Mount the external hdd

Run the next command:

```bash
sudo mkdir /mnt/ext-hdd
sudo mount /dev/sda /mnt/ext-hdd
```

### Verify the mount

Run the next command:

```bash
df -h
```

### Automatically mount the external hdd

To automatically mount the external hdd, we need to edit the `/etc/fstab` file.

Open the file with the next command:

```bash
sudo nano /etc/fstab
```

Add the next line to the end of the file:

```bash
/dev/sda /mnt/ext-hdd ext4 defaults 0 2
```

Save the file and exit the editor.

### Finally reboot the raspberry pi

```bash
sudo reboot
```

## 🐳 Docker instructions

### Docker-Compose Commands

- `sudo docker compose up -d` (This Docker-compose command helps builds the image, then creates and starts Docker containers. The containers are from the services specified in the compose file. If the containers are already running and you run docker-compose up, it recreates the container.)

- `sudo docker compose pull` (Pulls an image associated with a service defined in a docker-compose.yml)

- `sudo docker compose down` (The Docker-compose down command also stops Docker containers like the stop command does. But it goes the extra mile. Docker-compose down, doesn’t just stop the containers, it also removes them.)

- `sudo docker system prune -a --volumes --force` (Remove all unused containers, networks, images (both dangling and unreferenced), and optionally, volumes.)

### Docker network

All of the services are connected to the same network.
Because of that, you can access all of the services what you need using the service name.
For example, if you want to connect the Sonarr with qBitrorrent, you can use the next hostname:

```
host: qbittorrent
port: 8080
```

### Docker permissions

After run the containers and create the proper folders, we need to run the next commands to give the proper permissions to the folders.

```bash
sudo chown -R $USER:$USER /mnt/ext-hdd
sudo chmod -R a=,a+rX,u+w,g+w /mnt/ext-hdd
```

## 🔎 Trackers

- Torrenteros (ESP): https://torrenteros.org
- BitStream (ESP): https://bitstream.click

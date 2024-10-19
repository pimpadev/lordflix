# 🎞️ LordFlix - Media Center

This guide was created for manage a media center inside a Raspberry Pi. 

## ⚙️ Hardware recommended

A complete kit including case, power supply and micro sd card is recommended. In addition, an internal hard disk will be added to store the contents of the media server.

 - [Raspberry PI](https://amzn.to/4hq9mRN)
 - [HDD 3.5 4TB](https://amzn.to/4dSOcIV)
 - [3.5-inch HDD Enclosure](https://amzn.to/4fbvoWc)

## 💻 Software

In this tutorial we will install the **Raspberry Pi OS Lite** *(headless)* version. In the following link you will find the installer needed to prepare the operating system in the micro sd.

  - [Raspberry Pi OS Lite](https://www.raspberrypi.com/software/)

### Basic configuration

  - Configure SWAP Memory
  - Setup external HDD
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

## 🧠 Configure SWAP memory

This configuration will gonna help to improve the performance of the media center.

1. Create SWAP file
  ```bash
  sudo swapoff /swapfile
  sudo rm /swapfile
  sudo fallocate -l 2G /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  ```

2. Activate SWAP memory
  ```bash
  sudo swapon /swapfile
  ```

3. Verify the SWAP memory is active
  ```bash
   swapon --show
  ``` 

4. Persist changes editing `/etc/fstab` file
  ```bash
  sudo nano /etc/fstab
  ```
  ```bash
  /swapfile swap swap defaults 0 0 #Add this line
  ```

5. Reboot and verify
  ```bash
  sudo reboot
  ```
  ```bash
  free -h
  ```

## 💾 Prepare external HDD

This is a guide to prepare the external HDD for the media center.

### Identify the external HDD

Open the terminal and run the next command:

```bash
lsblk
```

The output should be similar to this:

```bash
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0 931.5G  0 disk
└─sda1        8:1    0   512M  0 part /mnt/ext-hdd
mmcblk0       8:2    0     1G  0 disk 
├─mmcblk0p1   8:2    0     1G  0 part /boot/firmware
└─mmcblk0p2   8:4    0 931.5G  0 part /
```

In this example, the external HDD is `/dev/sda`.

### Umount disk

We can see there are already one partition `sda1`. We need to umount before continue:

```bash
sudo umount /dev/sda1
```

### Create new partition
If you want to delete all existing partitions and create a new partition table, you can use fdisk.

Run the following command to open fdisk for the disk:

```bash
sudo fdisk /dev/sda
```

Inside **fdisk**, you can do the following:

1. Press **d** to delete existing partitions (if any).
2. Press **n** to create a new partition.
3. Choose **p** to create a primary partition. Then, specify the size of the partition (press enter to use the entire disk).
4. Type **w** to save the changes and exit fdisk.

### Format the external HDD

Run the next command:

```bash
sudo mkfs.ext4 /dev/sda1
```

### Mount the external HDD

Run the next command:

```bash
sudo mkdir /mnt/ext-hdd
sudo mount /dev/sda1 /mnt/ext-hdd
```

### Verify the mount

Run the next command:

```bash
df -h
```

### Automatically mount the external HDD

To automatically mount the external HDD, we need to edit the `/etc/fstab` file.

Open the file with the next command:

```bash
sudo nano /etc/fstab
```

Add the next line to the end of the file:

```bash
/dev/sda1 /mnt/ext-hdd ext4 defaults 0 2
```

Save the file and exit the editor.

### Finally reboot the raspberry pi

```bash
sudo reboot
```

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

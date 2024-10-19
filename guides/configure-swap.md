# 🧠 Configure SWAP memory

This configuration will gonna help to improve the performance of the media center.

## Create SWAP file
```bash
sudo swapoff /swapfile
sudo rm /swapfile
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
```

## Activate SWAP memory
```bash
sudo swapon /swapfile
```

## Verify the SWAP memory is active
```bash
swapon --show
``` 

## Persist changes editing `/etc/fstab` file
```bash
sudo nano /etc/fstab
```

If this line doesn't exist, add it at the end of the file:

```bash
# SWAP File
/swapfile swap swap defaults 0 0
```

## Reboot and verify
```bash
sudo reboot
```
```bash
free -h
```

# 🧠 Configure SWAP memory

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
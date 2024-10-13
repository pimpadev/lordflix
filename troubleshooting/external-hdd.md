# 💾 Connectivity issues with external HDD

I noticed some issues related the connection with external HDD. Specially if they have their own power supply.

If for some reason the Raspberry PI can't connect to the HDD (Raspberry PI gets frozen after reboot or after reboot HDD is not recognised, etc.) some configurations at `/etc/fstab` can be done.

```bash
sudo nano /etc/fstab
```

1. Instead of using the hdd path `/sda/sda1` we will use the `PARTUUID`. With the command `sudo blkid` you can find the value.

2. Use of `nofail` parameter. That parameter will prevent the system to get frozen if it can't mount the HDD.

3. Use of `x-systemd.device-timeout=30` parameter. That parameter will make the server wait 30 seconds before trying the connection. That's useful if the HDD needs time to wake up.

Applied example:

```bash
PARTUUID=389e9f29-a7e2-2f4e-b573-0b1a0d100c04 /mnt/ext-hdd ext4 defaults,nofail,x-systemd.device-timeout=30 0 2
```
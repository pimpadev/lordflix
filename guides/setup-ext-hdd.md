# 💾 Prepare external HDD

This is a guide to prepare the external HDD for the media center. Make sure you have connected the HDD to the raspberry PI before starting the tutorial.

## Identify the external HDD

Run the next command:

```bash
lsblk
```

The output should be similar to this:

```bash
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0   3.6T  0 disk
└─sda1        8:1    0   3.6T  0 part
mmcblk0       8:2    0  57.3G  0 disk 
├─mmcblk0p1   8:2    0   512M  0 part /boot/firmware
└─mmcblk0p2   8:4    0  56.8G  0 part /
```

In this example, the identified disk is `/dev/sda`.


## Create new partition

Run the following command to open fdisk for the disk:

```bash
sudo fdisk /dev/sda
```

Inside **fdisk**, you can do the following:

1. Press **d** to delete existing partitions (if any).
2. Press **n** to create a new partition.
3. Choose **p** to create a primary partition. Then, specify the size of the partition (press enter to use the entire disk).
4. Type **w** to save the changes and exit fdisk.

## Format the external HDD

Run the next command:

```bash
sudo mkfs.ext4 /dev/sda1
```

## Mount the external HDD

Run the next command:

```bash
sudo mkdir /mnt/ext-hdd
sudo mount /dev/sda1 /mnt/ext-hdd
```

## Verify the mount

Run the next command:

```bash
df -h
```

The output should be similar to this:

```bash
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda           8:0    0   3.6T  0 disk
└─sda1        8:1    0   3.6T  0 part /mnt/ext-hdd
mmcblk0       8:2    0  57.3G  0 disk 
├─mmcblk0p1   8:2    0   512M  0 part /boot/firmware
└─mmcblk0p2   8:4    0  56.8G  0 part /
```

## Automatically mount the external HDD

First we have to identify the `PARTUUID` of the disk, for this we use the following command:

```bash
blkid /dev/sda1
```

The output should be similar to this:

```bash
/dev/sda1: UUID="e1234567-89ab-4cde-1234-56789abcdef0" TYPE="ext4" PARTUUID="12345678-01"
```

The value we will use is `12345678-01`, copy it.

With this `PARTUUID` we need to open the next file using this command:

```bash
sudo nano /etc/fstab
```

Add the next line to the end of the file:

```bash
# HDD 4TB
PARTUUID=12345678-01 /mnt/ext-hdd ext4 defaults,nofail,x-systemd.device-timeout=30 0 2
```

Save the file and exit the editor.

## Reboot

Finally reboot the Raspberry Pi

```bash
sudo reboot
```
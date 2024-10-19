# 🧠 Configure SWAP memory

You know when you are mentally saturated and you decide to look for some kind of substance that frees you mentally and makes you reach valhala? This is more or less what we are looking for with this modification. Or so I think.

## Create SWAP file

This file will buffer your RAM in case you run out of RAM in the main RAM (too much RAM). A bargain, isn't it? No, because it is slower. But at least it prevents the system from crashing.

```bash
sudo swapoff /swapfile
sudo rm /swapfile
sudo fallocate -l 2G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
```

## Activate SWAP memory

Use the following command to activate the swap memory.

```bash
sudo swapon /swapfile
```

## Verify the SWAP memory is active

Verify, always verify.

```bash
swapon --show
```

The output should be something like that:
```bash
NAME      TYPE SIZE   USED PRIO
/swapfile file   2G 467.8M   -2
/var/swap file 200M     0B   -3
```

## Persist changes editing `/etc/fstab` file

If you do not want to repeat what you have done in this tutorial again, you have to edit the following file:

```bash
sudo nano /etc/fstab
```

If this line doesn't exist, add it at the end of the file:

```bash
# SWAP File
/swapfile swap swap defaults 0 0
```

## Reboot

Reboot needed to apply changes.

```bash
sudo reboot
```

## Verify Verify

Verify

```bash
free -h
```

You should see something like that:
`Swap:          2.2Gi       465Mi       1.7Gi`

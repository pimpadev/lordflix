# 🧠 Configure SWAP memory

You know when you are mentally saturated and you decide to look for some kind of substance that frees you mentally and makes you reach valhala? This is more or less what we are looking for with this modification. Or so I think.

## Activate SWAP file

This file will buffer your RAM in case you run out of RAM in the main RAM (too much RAM). A bargain, isn't it? No, because it is slower. But at least it prevents the system from crashing.

```bash
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

## Increase SWAP memory

Use the following command to modify the swap configuration.

```bash
sudo nano /etc/dphys-swapfile
```

A config file will be opened. We need to change the value of `CONF_SWAPSIZE` from 200 to 2048. Then save and close the file. After changes use the next command to reboot the SWAP memory and apply the changes:

```bash
sudo dphys-swapfile setup
sudo dphys-swapfile swapon
```

## Verify the SWAP memory is active

Verify, always verify.

```bash
swapon --show
```

The output should be something like that:
```bash
NAME      TYPE SIZE   USED PRIO
/var/swap file   2G     0B   -2
```

## Verify Verify

Verify.

```bash
free -h
```

You should see something like that:
`Swap:          2.0Gi       0Mi       2Gi`

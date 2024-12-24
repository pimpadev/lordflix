# Updating the operative system

## Automate security updates

To maintain security updates up to date, is recommended to install the next package:

```bash
sudo apt install unattended-upgrades
```

And then configure it using the next command:

```bash
sudo dpkg-reconfigure unattended-upgrades
```

## Debian

To update the repositories and upgrade the system, open a terminal and write the next line:

```bash
sudo apt update && sudo apt upgrade
```

Once the process finished, execute the next commands:

```bash
sudo apt autoremove
```

```bash
sudo apt clean
```

## Raspberry PI OS

To update the repositories and upgrade the system, use the next command:

```bash
sudo apt update && sudo apt full-upgrade
```

Once the process finished, execute the next commands:

```bash
sudo apt autoremove
```

```bash
sudo apt clean
```

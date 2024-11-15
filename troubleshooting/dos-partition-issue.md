# DOS tag partition issue

When you try to create a partition on a drive that is already tagged as a DOS partition, you may get the following error:

```bash
Welcome to fdisk (util-linux 2.38.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.

Device does not contain a recognized partition table.
The size of this disk is 3.6 TiB (4000728481792 bytes). DOS partition table format cannot be used on drives for volumes larger than 2199023255040 bytes for 512-byte sectors. Use GUID partition table format (GPT).

Created a new DOS (MBR) disklabel with disk identifier 0x370f3a04.
```

Use the following command to change the label to GUID:

```bash
Use command: g
```

It will change the label to GUID

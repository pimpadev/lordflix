# CRON Scripts

This folder contains the CRON scripts to run inside the raspberry pi.
To access the CRON scripts, you need to run the following command:

```bash
sudo crontab -e
```

## check_and_delete.sh

This script checks the media center folders and deletes the movies that are older than 30 days. You need to add the next line to the end of the file:

```bash
0 0 * * * /path/to/script/check_and_delete.sh >> /path/to/logs/check_and_delete.log 2>&1
```

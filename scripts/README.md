# CRON Scripts

The purpose of these scripts is to maintain basic server maintenance.

## Execution permissions

This folder contains the CRON scripts to run inside the raspberry pi. You need to execute the next command to give them execution permissions:

```bash
sudo chmod +x /home/aferbor/media-center/scripts/check_and_delete.sh
sudo chmod +x /home/aferbor/media-center/scripts/clean_logs.sh
```

## Setup CRON services
To access the CRON scripts, you need to run the following command:

```bash
sudo crontab -e
```

Then add the next lines to the file:

```bash
0 0 * * * /home/aferbor/media-center/scripts/check_and_delete.sh >> /home/aferbor/media-center/logs/check_and_delete.log 2>&1
0 0 * * * /home/aferbor/media-center/scripts/clean_logs.sh
```

## Scripts explanation

### check_and_delete.sh

This script checks the media center folders and deletes the movies that are older than 30 days. Additionally deletes the torrent file too.

### clean_logs.sh

This script checks the logs folder and deletes the logs that are older than 60 days.

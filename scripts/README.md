# CRON Scripts

These scripts will help you against digital diogenes. Because I know that on your own you will not delete anything and you will end up with a crashed system.

## Execution permissions

This folder contains the CRON scripts to run inside the Raspberry Pi. You need to execute the next command to give them execution permissions:

```bash
sudo chmod +x /home/$USER/lordflix/scripts/check_and_delete.sh
sudo chmod +x /home/$USER/lordflix/scripts/clean_logs.sh

```

## Setup CRON services
To access the CRON scripts, you need to run the following command:

```bash
crontab -e
```

Then add the next lines to the file:

```bash
0 0 * * * ~/lordflix/scripts/check_and_delete.sh >> ~/lordflix/logs/check_and_delete.log 2>&1
0 0 * * * ~/lordflix/scripts/clean_logs.sh
```

## Scripts explanation

### check_and_delete.sh

This script checks the media center folders and deletes the movies that are older than 30 days. Additionally deletes the torrent file too.

### clean_logs.sh

This script checks the logs folder and deletes the logs that are older than 60 days.

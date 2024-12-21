# CRON Scripts

These scripts will help you against digital diogenes. Because I know that on your own you will not delete anything and you will end up with a crashed system.

## Execution permissions

This folder contains the CRON scripts needed for maintenance. You need to execute the next command to give them execution permissions:

```bash
sudo chmod +x /home/$USER/lordflix/scripts/delete_old_media.sh
sudo chmod +x /home/$USER/lordflix/scripts/clean_logs.sh
```

## Setup CRON services

To access the CRON scripts, you need to run the following command:

```bash
crontab -e
```

Then add the next lines to the file:

```bash
0 0 * * * ~/lordflix/scripts/delete_old_media.sh 28800 >> ~/lordflix/logs/delete_old_media.log 2>&1
0 0 * * * ~/lordflix/scripts/clean_logs.sh
```

## Scripts explanation

### delete_old_media.sh

This script checks the media center folders and deletes the movies that are older than 28800 minutes (20 days). This value can be modified.

### clean_logs.sh

This script checks the logs folder and deletes the logs that are older than 60 days.

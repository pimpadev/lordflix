# CRON Scripts

This folder contains the CRON scripts to run inside the raspberry pi.
To access the CRON scripts, you need to run the following command:

```bash
sudo crontab -e
```

For each script, you need to give them execution permissions:

```bash
sudo chmod +x /path/to/script/script_name.sh
```

## check_and_delete.sh

This script checks the media center folders and deletes the movies that are older than 30 days. You need to add the next line to the end of the file:

```bash
0 0 * * * /path/to/script/check_and_delete.sh >> /path/to/logs/check_and_delete.log 2>&1
```

## clean_logs.sh

This script checks the logs folder and deletes the logs that are older than 60 days. You need to add the next line to the end of the file:

```bash
0 0 * * * /path/to/script/clean_logs.sh >> /path/to/logs/clean_logs.log 2>&1
```

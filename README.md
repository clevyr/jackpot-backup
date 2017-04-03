# Depot
--
##  Backup Anything Locally and to S3

This script will backup your files, dump any backups that are older than 7 days,
and sync them with S3.

## Prerequisites

You must have the `aws` cli tool installed.

## Getting Started

```
cp conf.sh.example conf.sh

# Edit:
#   AWS_PATH
#   S3_BUCKET
#   custom_backup_cmds() function
```

## Running Depot
```
./depot.sh
```

[Clevyr, Inc.](https://clevyr.com)

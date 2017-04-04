# Depot

Backup Anything Locally and to S3

This script will backup your files, remove any backups that are older than 7 days,
and (optionally) sync them with S3.

## Prerequisites

You must have the `aws` cli tool installed.

## Getting Started

```
cp conf.sh.example conf.sh
```

Here's what you need to edit in `conf.sh`:

```
# REQUIRED - Edit the Backup Function:
#   custom_backup_cmds()

# To Add S3 Syncing, edit:
#   AWS_PATH  - the path to the aws command
#   S3_BUCKET - the name of the bucket you are syncing with
```

The `custom_backup_cmds` function is where will issue shell commands to create
all your backup scripts. That function receives the right backup directory as an
argument, and you can use it as `$1` - like so:

```
# Example
custom_backup_cmds () {
  mysqldump -u foo -p bar db > $1/backup.sql
}
```

## Running Depot
```
./depot.sh
```

[Clevyr, Inc.](https://clevyr.com)

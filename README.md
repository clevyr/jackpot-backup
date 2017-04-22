# Jackpot Backup

Jackpot will backup all your files from the last:
  * 7 days
  * 7 months (one backup each month)
  * 7 years (one backup each year)

And it will automatically remove old backups.

777? You hit the Jackpot!

## Where does it store backups?

Jackpot currently stores your files:
  * Locally
  * Remotely to S3 (optional)
  * *More coming soon*


## Prerequisites

To sync to an AWS S3 bucket, you must have the `aws` cli tool installed.

## Getting Started

```
cp conf.sh.example conf.sh
```

Here's what you need to edit in `conf.sh`:

```
# REQUIRED - Edit the main_backup() Function:
#   main_backup()

# OPTIONAL:
#   To Add S3 Syncing, edit:
#     AWS_PATH  - the path to the aws command
#     S3_BUCKET - the name of the bucket you are syncing with
```

The `main_backup` function is where you will issue shell commands to create
all your backup scripts. That function receives the right backup directory as an
argument, and you can use it as `$1` - like so:

```
# Example
main_backup () {
  mysqldump -u foo -p bar db > $1/backup.sql
}
```

Anything in the `$1` directory will get zipped up into a single file, and that's
what becomes your backup. Store database dumps, code, assets, anything you want!

## Running Jackpot
```
./jackpot.sh
```

[Clevyr, Inc.](https://clevyr.com)

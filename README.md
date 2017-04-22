# Jackpot Backup

Jackpot will backup all your files from the last:
  * 7 days
  * 7 months (one backup each month)
  * 7 years (one backup each year)

And it will automatically remove old backups.

777? You hit the Jackpot!

## Where does it store backups?

Jackpot currently stores your files:
  * Locally - in the **/backups** directory
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
#   after_backup()
#
#   To Add S3 Syncing, edit:
#     AWS_PATH  - the path to the aws command
#     S3_BUCKET - the name of the bucket you are syncing with
```

### main_backup
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

### after_backup (optional)
The `after_backup` function is where you will perform any extra logic once your
backup has been created. The first paramater is the compressed backup file.

```
# Example
after_backup () {
  scp $1 new.server.com:~/backups
}
```

## Running Jackpot
```
./jackpot.sh
```

### In Production

In production, you'll definitely want to set up jackpot as a cron job that runs every
day:

```
# Every day at midnight
0 0 * * * full/path/to/jackpot.sh
```

MIT Licensed
[Clevyr, Inc.](https://clevyr.com)

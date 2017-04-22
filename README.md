# Jackpot Backup

Jackpot will backup all of your files from the last:
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

This library depends on the **GNU Date** command. This should exist on most linux
distributions by default. On Mac OSX, doesn't - so you'll need to install the
coreutils package to get it:

```
brew install coreutils

# Now you can run `gdate`
```

### For S3 Backup

To sync to an AWS S3 bucket, you must have the `aws` cli tool installed.

## Getting Started

```
cp conf.sh.example conf.sh

# Now edit conf.sh
```

Here's what you need to edit in `conf.sh`:

```
REQUIRED:
  main_backup()

OPTIONAL:
  after_backup()

  To Add S3 Syncing, edit:
    AWS_PATH  - the path to the aws command
    S3_BUCKET - the name of the bucket you are syncing with
```

### main_backup
The `main_backup` function is where you will issue shell commands to create
all of your backup scripts. That function a directory as an
parameter (`$1`) - and you should dump all of your files in there:

```
# Example
main_backup () {
  mysqldump -u foo -p bar db > $1/backup.sql
}
```

Anything in the `$1` directory will get compressed up into a single file, and that's
what becomes your backup. Store database dumps, code, assets, anything you want
in there!

### after_backup (optional)
The `after_backup` function is where you can perform any extra logic once your
backup has been created. The first parameter is the compressed backup file.

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

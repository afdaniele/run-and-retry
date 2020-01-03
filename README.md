# run-and-retry

**rretry** (run-and-retry) is a utility for running the same command multiple times and with increasing timeout


## Install

You can install **rretry** using pip:

```
pip3 install run-and-retry
```


## Get started

The simplest **rretry** command looks like the following

```
rretry --min 2 --tries 3 -- sleep 3
```

This will try to run the command `sleep 3` three times (`--tries 3`), with a timeout of `2` seconds
(`--min 2`) for the first attempt, `4` for the second and `6` for the third.
If we run this command, the output will be

```
INFO:rretry: Attempt #0 [timeout: 2]
INFO:rretry: Attempt #0 timed out!
INFO:rretry: Attempt #1 [timeout: 4]
INFO:rretry: Attempt #1 succeeded!
INFO:rretry: Done!
```



## Usage

The syntax for **rretry** is very simple:

```
usage: rretry [-h] -m MIN [-M MAX] [-n TRIES] [--no-retry-on-error]
              [- ON_FAIL] [-c ON_RETRY] [-i] [-D] [--verbose]
              command [command ...]
 
positional arguments:
  command
 
optional arguments:
  -h, --help            show this help message and exit
  -m MIN, --min MIN     Minimum timeout (in seconds)
  -M MAX, --max MAX     Maximum timeout (in seconds)
  -n TRIES, --tries TRIES
                        Maximum number of retries
  --no-retry-on-error   Do not retry when the command fails (as opposed to
                        time out)
  - ON_FAIL, --on-fail ON_FAIL
                        Command to run after last failure
  -c ON_RETRY, --on-retry ON_RETRY
                        Command to run after every failed attempt
  -i, --interactive     Whether to run the commands in interactive mode
  -D, --dry-run         Performs a dry-run. It shows which commands would run
  --verbose, --debug    Run in verbose mode
```

#!/bin/sh
set -u

URL=http://localhost/health
WARMING_TIME=20
TIME_OUT=60
INTERVAL=5

# error handling
trap 'echo "$(date +"%Y-%m-%d %H:%M:%S") URL: $URL NG"' ERR

# wait until webserver is started.
sleep $WARMING_TIME

COUNT=1
RETRY_COUNT=$((TIME_OUT / INTERVAL))

while true; do
    wget -nv --spider $URL 2>&1 | grep '200 OK'
    if [ $? -eq 0 ]; then
        break
    fi
    if [ $COUNT -eq $RETRY_COUNT ]; then
        echo "$(date +"%Y-%m-%d %H:%M:%S") URL: $URL Timeout!" >&2
        exit 1
    fi
    (( COUNT++ ))
    sleep $INTERVAL
done

exit 0

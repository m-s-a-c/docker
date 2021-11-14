#!/bin/sh
set -e

export SCRIPT_NAME=/ping
export SCRIPT_FILENAME=/ping
export REQUEST_METHOD=GET

if [ -z $ALERT_POST_URL ]; then

  exit 0

fi

if curl --silent --fail localhost:3030/status; then
  # curl -X POST -H 'Content-type: application/json' --data '{"text":"['$NODE_ENV'] This is Server status monitoring test: [OK]!"}' $ALERT_POST_URL
  exit 0
fi

curl -X POST -H 'Content-type: application/json' --data '{"text":"['$NODE_ENV'] This is Server status monitoring test: [FAIL]!"}' $ALERT_POST_URL
exit 1


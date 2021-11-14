#!/bin/bash

set -e

if [[ "$RUN_MODE" == 'dev' ]]; then
    npm run devstart
else
    npm start
fi

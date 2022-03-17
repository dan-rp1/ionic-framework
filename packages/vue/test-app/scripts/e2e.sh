#!/bin/bash

TESTS_PATH=$1
FILE_EXTENSION=$2
CURRENT_SHARD=$3
TOTAL_SHARDS=$4

node_modules/.bin/concurrently "npm run start -- --mode production" "node_modules/.bin/wait-on http-get://localhost:8080 && npm run cypress -- --spec $(./scripts/shard.sh ${TESTS_PATH} ${FILE_EXTENSION} ${CURRENT_SHARD} ${TOTAL_SHARDS})"  --kill-others --success first

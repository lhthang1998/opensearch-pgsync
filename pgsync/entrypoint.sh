#!/usr/bin/env bash

wait-for-it $PG_HOST:$PG_PORT -t 60
wait-for-it $REDIS_HOST:$REDIS_PORT -t 60
wait-for-it $ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT -t 60

jq '.[].database = env.PG_DATABASE' schema.json | sponge schema.json
sleep 30
bootstrap --config ./schema.json
pgsync --config ./schema.json -d --daemon
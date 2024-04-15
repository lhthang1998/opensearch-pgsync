#!/usr/bin/env bash

wait-for-it $PG_HOST:$PG_PORT -t 60
wait-for-it $REDIS_HOST:$REDIS_PORT -t 60
wait-for-it $ELASTICSEARCH_HOST:$ELASTICSEARCH_PORT -t 60

jq '.[].database = env.PG_DATABASE' schema.json | sponge schema.json

bootstrap --config ./schema.json
sleep 10
pgsync --config ./schema.json -d --daemon
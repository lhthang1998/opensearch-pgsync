#!/bin/bash
rm -rf opensearch-data elasticsearch-data postgres-data
docker-compose -f docker-compose-es.yml down --remove-orphans
docker-compose -f docker-compose-es.yml up --build -d
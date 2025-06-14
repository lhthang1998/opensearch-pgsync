#!/bin/bash
rm -rf opensearch-data elasticsearch-data postgres-data
docker-compose -f docker-compose.yml down --remove-orphans
docker-compose -f docker-compose.yml up --build -d
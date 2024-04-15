#!/bin/bash
docker-compose -f docker-compose-es.yml down
docker-compose -f docker-compose-es.yml up --build -d
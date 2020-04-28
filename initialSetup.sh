#!/bin/bash
mkdir -p volumes/{config,file,logs}
cp vault.json volumes/config
docker-compose up &
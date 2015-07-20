#!/bin/bash
#Start all containers
docker start $(docker ps -a -q)

#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))

source $BASEDIR/color.sh

echo -e "${GREEN}${BOLD}Creating data dir if it does not exist${NC}"
mkdir -p $BASEDIR/data
echo -e "${GREEN}${BOLD}Sudo'ing to clean data dir${NC}"
sudo rm -rf $BASEDIR/data/*
echo -e "${GREEN}${BOLD}Building container${NC}"
docker build -t influx-skipping-shard $BASEDIR

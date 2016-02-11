#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))

source $BASEDIR/color.sh

if [[ ! -z `docker ps -a | grep "influx-skipping-shard"` ]]; then
	echo -e "${RED}${BOLD}Removing old container${NC}"
	docker rm influx-skipping-shard
fi

echo -e "${GREEN}${BOLD}Running container in daemon mode${NC}"
docker run -d \
--name=influx-skipping-shard \
-h influx-skipping-shard \
-v "$BASEDIR/data":/data \
influx-skipping-shard

echo -e "${GREEN}${BOLD}Wait 10 seconds for influx to start up${NC}"
sleep 10
echo -e "${GREEN}${BOLD}Insert data${NC}"
$BASEDIR/create_data.sh

echo -e "${GREEN}${BOLD}Stopping container${NC}"
docker stop influx-skipping-shard
echo -e "${RED}${BOLD}Removing old container${NC}"
docker rm influx-skipping-shard

echo -e "${GREEN}${BOLD}Running container with logs${NC}"
docker run -it --rm \
--name=influx-skipping-shard \
-h influx-skipping-shard \
-v "$BASEDIR/data":/data \
influx-skipping-shard
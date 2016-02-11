#!/bin/bash

docker exec -it influx-skipping-shard influx -host influx-skipping-shard -execute 'CREATE DATABASE testdb'
docker exec -it influx-skipping-shard curl -i -XPOST 'http://influx-skipping-shard:8086/write?db=testdb' --data-binary 'cpu_load_short,host=server02 value=0.67
cpu_load_short,host=server02,region=us-west value=0.55 1422568543702900257
cpu_load_short,direction=in,host=server01,region=us-west value=2.0 1422568543702900257'

docker exec -it influx-skipping-shard influx -host influx-skipping-shard -database testdb -execute 'SELECT * FROM cpu_load_short'

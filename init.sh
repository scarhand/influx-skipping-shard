#!/bin/bash

HOST=`hostname`
sed -i "s/<HOST>/$HOST/g" /etc/influxdb/influxdb.conf

exec influxd -config /etc/influxdb/influxdb.conf
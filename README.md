## influx-skipping-shard

When influx runs inside a docker container with a mounted volume for its data, the data cannot be loaded when the container is stopped and started.

### Steps to reproduce
Check out this repository, then run `make.sh`.
```
$ git clone git@github.com/scarhand/influx-skipping-shard.git
$ cd influx-skipping-shard
$ ./make.sh
```


The make script will build a container with influx installed from apt. It will then run the container in daemon mode, create a database (testdb) and insert some data in it.
The container will then be stopped and started again. If the container starts for the second time the data in the created database can not be read. Influx show the error message: `Skipping shard: testdb. Not a valid path`.

Influx issue: [https://github.com/influxdata/influxdb/issues/5627](https://github.com/influxdata/influxdb/issues/5627)
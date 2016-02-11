#!/bin/bash
BASEDIR=$(dirname $(readlink -f $0))

$BASEDIR/build.sh && $BASEDIR/run.sh

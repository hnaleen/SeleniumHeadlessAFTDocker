#!/bin/sh
/opt/bin/entry_point.sh &

sudo git clone $repoUrl testcode

cd testcode

sudo mvn clean install


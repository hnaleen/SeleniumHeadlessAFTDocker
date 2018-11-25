#!/bin/sh

sudo git clone $repoUrl testcode

cd testcode

sudo mvn clean install


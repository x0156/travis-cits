#!/bin/bash

set -x

CITS_FNAME=cognizant-intelligent-test-scripter
CITS_VERSION=1.0-SNAPSHOT
CITS_TAG=v1.0-snapshot
CITS_REPO=CognizantQAHub/Cognizant-Intelligent-Test-Scripter
CITS_ROOT=lib/$CITS_FNAME/$CITS_VERSION
#download
curl -O -L "https://github.com/$CITS_REPO/releases/download/$CITS_TAG/$CITS_FNAME-$CITS_VERSION-setup.zip"
#extract
unzip $CITS_FNAME-$CITS_VERSION-setup.zip
#create install dir
mkdir -p $CITS_ROOT
mv $CITS_FNAME-$CITS_VERSION/* $CITS_ROOT
cat $CITS_ROOT/Run.command > $CITS_ROOT/CITS
#apply permission
chmod +x $CITS_ROOT/CITS
PATH=$CITS_ROOT:$PATH
cat $CITS_ROOT/CITS
CITS -version
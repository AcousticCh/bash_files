#!/bin/bash

MACLIST=c4:65:16:f5:f7:ed
FAKEMAC=08:00:27:bf:6b:e8

ifconfig $1 down
ifconfig $1 hw ether $MACLIST
ifconfig $1 up

echo "New MAC is $MACLIST"

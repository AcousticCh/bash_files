#!/bin/bash

INTERFACE=$1
MYMAC="c4:65:16:f5:f7:ed"  
FAKEMAC="08:00:27:bf:6b:e8"
MACLIST="0" 
ifconfig $INTERFACE > ./bash_data/interface_data.txt
grep -E "\s([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}\s)" ./bash_data/interface_data.txt


#TODO fix spacing in output
#TODO create list of mac adresses to select random mac from.
#TODO create random funtion to select from maclist
#TODO create funtion to build new random mac adresses

sudo ifconfig $INTERFACE down
sudo ifconfig $INTERFACE hw ether $MYMAC
sudo ifconfig $INTERFACE up

ifconfig $INTERFACE > ./bash_data/interface_data.txt
grep -E "\s([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2}\s)" ./bash_data/interface_data.txt


#!/bin/bash

NUM1=$1
NUM2=$2

if [ $NUM1 -gt $NUM2 ]
then
	echo "First number is higher"
else
	echo "Second number is higher"
fi

echo complete

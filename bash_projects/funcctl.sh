#!/bin/bash

envctl()
{
	if [ $1 = "-c" ] || [ $1 = "--create" ]
	then
		python3 -m venv $2
		echo $(pwd)/$2 >> ~/text_files/my_environment.txt
	elif [ $1 = "-a" ] || [ $1 = "--activate" ]
	then
		source ./$2/bin/activate
	else
		echo "Invalid option"
	fi
}

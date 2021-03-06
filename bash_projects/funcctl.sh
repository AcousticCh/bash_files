#!/bin/bash

search()
{
        case $1 in
                "-ff" | "--findfile")
                #find file in directory
                case $4 in
                        "-r" | "--regex")
                        sudo find $3 -type f -name $2 | grep $5
                        ;;
                        *)
                        sudo find $3 -type f -name $2
                        ;;
                esac
                ;;

                "-fd" | "--finddir")
                #find directory in directory
                case $4 in
                        "-r" | "--regex")
                        sudo find $3 -type d -name $2 | grep $5
                        ;;
                        *)
                        sudo find $3 -type d -name $2
                        ;;
                esac
                ;;

                "-l" | "--locate")
                #locate file or directory
                sudo updatedb
                case $3 in
                        "-r" | "--regex")
                        sudo locate $2 | grep $4
                        ;;

                        *)
                        sudo locate $2
                        ;;
                esac
                ;;

                *)
                echo "Commands: "
                echo "find:"
                echo "  -ff, --findfile: Uses find command to find files, "
                echo "          ex: search -ff <file> <dir tree to search>"
                echo "  -fd, --finddir: Uses find command to find directories, "
                echo "          ex: search -fd <dir> <dir tree to search>"
                echo "locate:"
                echo "  -l, --locate: updates database and uses locate command to find files or directories"
                echo "          ex: search -l <file/dir>"
                echo "grep:"
                echo "  -r, --regex: refine any search by adding grep as a final parameter"
                echo "          ex: search -l <file> -r <keyword>"
                ;;
        esac

}

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

################################## 
#Authored by Vidyasagar Machupalli
##################################
#!/bin/sh

set -e
set -u
set -o pipefail

# check whether user had supplied -h or --help . If yes display usage
if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then
	echo "Usage: $0 <get_files or get_file_names> <PATH_TO_THE_DIRECTORY> <FILE_TYPE_TO_LOOK_FOR>"
    echo "For example: ./get_file_info get_files /User/vmac/Downloads .txt"
	exit 0
fi

get_files () {
    for file in "$1/*$2"
    do
        echo $file
    done
}

get_file_names () {
    echo "I am filenames"
    for file in "$1/*$2"
    do
        echo $file
        filename=$(basename $file $2)
        echo $filename
    done
}

case "$1" in
    "") ;;
    get_files) "$@"; exit;;
    get_file_names) "$@"; exit;;
    *) log_error "Unknown function: $1()"; exit 2;;
esac

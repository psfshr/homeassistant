#!/bin/bash

usage()
{
    echo "usage: zzrun.sh [-f file] | [-h]"
}

runesphome ()
{
    if [ -f "$filename" ]; then
        if [[ $filename =~ "-base" ]]; then
            echo "Trying to install a base file, please run manually!!"
        else
            echo "Running esphome for file => $filename"
            source .venv/bin/activate
            esphome run $filename
            deactivate
        fi
    else 
        echo "$filename does not exist."
    fi
}

##### Main

filename=

if [ $# -eq 0 ]; then
    echo "Your command line contains no arguments"
    usage
    exit
fi

while [ "$1" != "" ]; do
    case $1 in
        -f | --filename )     shift
                                filename=$1
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

runesphome

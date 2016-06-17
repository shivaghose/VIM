#!/bin/bash
# This script should reside in the base dot_files directories

show_help () {
    echo "Usage: ./deploy.sh [-v] [-h]"
    printf "\t -v Verbose mode.\n"
    printf "\t -h  Show help.\n"
}

verbose=false
force_overwrite=false

# Process args
while getopts "h?vf" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    v)  verbose=true
        ;;
    f)  force_overwrite=true
        ;;
    esac
done

link_args="-s"
if [ "$force_overwrite" = true ]; then
    echo "WARNING: FORCE WRITE MODE ACTIVE!"
    link_args="-sf"
fi


# Get the path to this script:
current_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Get the path to the dot files:
dot_files_dir="$current_dir"/home/*

# Go through each dot file and create a sym-link
for file_path in $dot_files_dir
do
    if [ "$verbose" = true ]; then
        echo "Found: $file_path"
    fi
    file_name=$(basename $file_path)
    if [ "$verbose" = true ]; then
        echo "Base name: $file_name"
    fi
    dot_file_name=$HOME/."$file_name"
    if [ "$verbose" = true ]; then
        echo "Dot file name: $dot_file_name"
    fi
    echo "Linking $dot_file_name"
    ln $link_args $file_path $dot_file_name
done

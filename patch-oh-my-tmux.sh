#!/bin/bash

# Solve for the current directory to use as root of the repo
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#-------------------- SCRIPT BEGINS HERE --------------------#

cd "${DIR}/ohmytmux"

###find . -iname ".tmux.*" | xargs -I '{}' -n 1 -P 4 -- sed -i "s/.tmux.conf/.tmux.oh-my-tmux.conf/g" {}

# change the reference, so that the magic works correctly
sed -i "s/\.tmux\.conf/\.tmux\.oh-my-tmux\.conf/g" ".tmux.conf"

#!/bin/bash

## Solve for the current directory to use as root of the repo
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

DIR="${DIR}/files"

cd ${DIR}


find . -type d -exec echo mkdir -p ~/{} \;
find . -type f -or -type l | xargs -n 1 --replace='{}' -P 8 -- ln --verbose -s $(pwd)/{} ${HOME}/{}

### if [[ ! -d ~/.tmux/plugins ]] ; then
###     echo mkdir -p ~/.tmux/plugins
###     echo git clone https://github.com/tmux-plugins/tpm ~/.tmux/
### fi

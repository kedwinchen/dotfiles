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

#for f in $(ls -A "${DIR}") ; do
#    echo cp -a "${DIR}/${f}" ~/${f}
#    echo sed -i "s|/home/kedwin|/home/${USER}|g" ~/${f}
#done

cd ${DIR}



find . -type d -exec echo mkdir -p ~/{} \;
find . -type f -exec echo cp -a {} ~/{} \;

if [[ ! -d ~/.oh-my-zsh ]] ; then
    echo git clone https://github.com/robbyrussell/oh-my-zsh ~/.oh-my-zsh
fi

if [[ ! -d ~/.tmux/plugins ]] ; then
    echo mkdir -p ~/.tmux/plugins
    echo git clone https://github.com/tmux-plugins/tpm ~/.tmux/
fi

#!/bin/bash

# set -euo pipefaii

## Solve for the current directory to use as root of the repo
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd ${DIR}
if [[ -d "./.git" ]] ; then
    git submodule update --init --recursive
fi

bash ./patch-oh-my-tmux.sh

DIR="${DIR}/files"

cd "${DIR}"

now () {
    printf "%s" "$(date +%Y%m%d_%H%M%S%z)"
}

create_dotfile_symlink () {
    THE_FILE="${1}"
    FILE_SRC="${DIR}/${THE_FILE}"
    FILE_DST="${HOME}/${THE_FILE}"

    if [[ -e "${FILE_DST}" ]] ; then
        mv "${FILE_DST}" "${FILE_DST}.dotfile-setup.$(now)"
    fi

    ln -v -s "${FILE_SRC}" "${FILE_DST}"

    ### if [[ $? -ne 0 ]] ; then
    ###     ln -v -f -s "${FILE_SRC}" "${FILE_DST}"
    ### fi
}

export DIR
export -f now
export -f create_dotfile_symlink

# Use "xargs" instead of "-exec" for parallelization
find . -type d | xargs -n 1 -I '{}' -P 8 -- mkdir -p ${HOME}/{}
find . -type f -or -type l | cut -c3- | xargs -n 1 -I '{}' -P 8 -- bash -c "create_dotfile_symlink '{}'"

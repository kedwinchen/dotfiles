#!/bin/bash

_source_if_exists() {
    local readonly THE_FILE="${HOME}/${1}"
    if [[ -f "${THE_FILE}" || -L "${THE_FILE}" ]]; then
        source "${THE_FILE}"
    else
        echo "[i] (.bashrc) :: Could not find ${THE_FILE}"
    fi
}

_source_if_exists ".bashrc.manjaro_default"
_source_if_exists ".bash_alias"
_source_if_exists ".bash_export"

shopt -s histappend
shopt -s cdspell
shopt -s autocd

set -o vi
umask 077

#!/bin/bash

_source_if_exists() {
    local readonly THE_FILE="${1}"
    if [[ -f "${THE_FILE}" || -L "${THE_FILE}" ]]; then
        source "${THE_FILE}"
    else
        echo "[i] (.bashrc) :: Could not find ${THE_FILE}"
    fi
}

_home_rc() {
    _source_if_exists "${HOME}/${1}"
}

_home_rc ".bashrc.manjaro_default"
_home_rc ".bash_alias"
_home_rc ".bash_export"
_source_if_exists "/etc/profile.d/autojump.bash"

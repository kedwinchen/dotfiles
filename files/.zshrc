#!/bin/zsh

function _source_if_exists {
    local readonly THE_FILE="${1}"
    if [[ -f "${THE_FILE}" || -L "${THE_FILE}" ]]; then
        source "${THE_FILE}"
    else
        echo "[i] (.zshrc) :: Could not find ${THE_FILE}"
    fi
}

function _home_rc {
    _source_if_exists "${HOME}/${1}"
}

_home_rc ".zshrc.manjaro_default"
_home_rc ".zshrc.ohmyzsh"
_home_rc ".zsh_alias"
_home_rc ".zsh_export"
_source_if_exists "/etc/profile.d/autojump.zsh"
_home_rc "powerlevel10k/powerlevel10k.zsh-theme"
_home_rc ".p10k.zsh"

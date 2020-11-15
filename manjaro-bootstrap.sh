#!/bin/bash

sudo -i pacman -S yay

yay -S --needed \
    kitty tmux mlocate autojump git \
    neovim neovim-airline neovim-coc neovim-coc-sh-git neovim-coc-go-git neovim-coc-git-git neovim-coc-html-git neovim-coc-java-git neovim-coc-json-git neovim-coc-python-git neovim-coc-pairs-git neovim-coc-syntax-git neovim-coc-yaml-git neovim-coc-highlight-git neovim-nerdtree \
    firefox thunderbird \
    polybar rofi neofetch \
    mons uxplay \
    cuda intel-opencl-runtime \
    cockpit-podman podman podman-docker catatonit crun \
    zoom teamsw webex-teams \
    obs-studio obs-v4l2sink v4l2loopback-dkms \
    vlc spotify \
    lastpass-cli authy \
    wireguard-tools networkmanager-wireguard \
    otf-nerd-fonts-fira-code \
    firejail{,-pacman-hook} fire{ctl,warden,tools} \
    usbguard{,-notifier} \
    pulseaudio pavucontrol pulseaudio-modules-bt libldac \
    qemu libvirt edk2-ovmf virt-manager virt-viewer lxc lxd \
    kleopatra veracrypt \
    ansible minikube kubectl \
    virtualbox virtualbox-ext-oracle virtualbox-host-dkms \
    slack-desktop signal-desktop ferdi-bin discord \
    obsidian-appimage code gitahead \
    p7zip p7zip-gui \
    toggldesktop \
    ibus-libpinyin ibus-mozc mozc noto-fonts-cjk-otf noto-fonts \
    texlive-full matlab

if [[ ! -f "${HOME}/.config/.blackarch_installed" ]]; then
    cd /tmp
    curl -O https://blackarch.org/strap.sh
    echo d062038042c5f141755ea39dbd615e6ff9e23121 strap.sh | sha1sum -c
    if [[ 0 -eq $? ]] ; then
        chmod +x strap.sh
        sudo ./strap.sh
        yay -Syy --overwrite='*' --needed blackarch
        touch "${HOME}/.blackarch_installed"
    else
        echo "WARNING: BLACKARCH BOOTSTRAP SCRIPT CHECKSUM CHANGED! PLEASE VERIFY"
        exit 1
    fi
    cd "${OLDPWD}"
else
    echo "skipping BlackArch installation..."
fi

sudo -i firecfg

if [[ ! -f "${HOME}/.config/usbguard_basic-configured" ]]; then
    sudo -i usbguard add-user $(whoami)
    sudo -i usbguard generate-policy | sudo -i tee /etc/usbguard/rules.conf
else
    echo "skipping USBGuard configuration..."
fi

sudo -i systemctl enable --now sshd cockpit.socket podman.socket libvirtd usbguard usbguard-dbus


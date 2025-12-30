#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 -y copr enable peterwu/rendezvous

# Base Packages
PACKAGES=(
    bibata-cursor-themes
    papirus-icon-theme
    mpv
    gparted
    java-25-openjdk
)


# Remove Unneeded and Disable Repos
# UNINSTALL_PACKAGES=(

# )

dnf5 install -y --allowerasing \
    --setopt=install_weak_deps=False \
    -x bluefin-readymade-config \
    "${PACKAGES[@]}"


# dnf5 remove -y "${UNINSTALL_PACKAGES[@]}"

# Use a COPR Example:

# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

#systemctl enable podman.socket

# Removing starship from system bashrc bashconfig, becuse I don't like bling in bash.
sed -i.bak '/starship init bash/s/^/# /' /etc/bashrc

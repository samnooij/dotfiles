#!/usr/bin/env bash

set -euo pipefail

DEFAULT_PALETTE="Kanagawa"
DEFAULT_SHELL="/home/linuxbrew/.linuxbrew/bin/fish"
DEFAULT_LABEL="Work Profile"

DEFAULT_OPACITY="1.0"
DEFAULT_FONT="Monospace 11"

uuid="$(dconf read /org/gnome/Ptyxis/default-profile-uuid 2>/dev/null | tr -d "'")"
if [[ -z "$uuid" ]]; then
    uuid="$(dconf read /org/gnome/Ptyxis/profile-uuids 2>/dev/null \
        | grep -oP "'[^']+'" | head -1 | tr -d "'")"
fi

if [[ -z "$uuid" ]]; then
    echo "no Ptyxis profile found; open Ptyxis once and rerun" >&2
    exit 0
fi

dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/palette" "'${DEFAULT_PALETTE}'"
echo "Set profile ${uuid} palette to '${DEFAULT_PALETTE}'"

dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/custom-command" "'${DEFAULT_SHELL}'"
echo "Set profile ${uuid} shell to '${DEFAULT_SHELL}'"

dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/label" "'${DEFAULT_LABEL}'"
dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/use-custom-command" "true"
echo "Set profile ${uuid} name to '${DEFAULT_LABEL}'"

dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/bold-is-bright" "true"
dconf write "/org/gnome/Ptyxis/Profiles/${uuid}/opacity" "'${DEFAULT_OPACITY}'"

dconf write /org/gnome/Ptyxis/use-system-font "false"
dconf write /org/gnome/Ptyxis/font-name "'${DEFAULT_FONT}'"
echo "Set font to '${DEFAULT_FONT}'"

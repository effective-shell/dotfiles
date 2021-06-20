#!/usr/bin/env sh

# This script installs the dotfiles locally. Note that it should be run from the
# dotfiles folder so that the links are set properly!

# Fail on errors.
set -e

# Uncomment this line to trace the script commands.
# set -x

# Create links for the shell configuration.
ln -sf "$PWD/shell.sh" "$HOME/.shell.sh"
ln -sf "$PWD/shell.d" "$HOME/.shell.d"

# Source our shell configuration in any local shell config files.
config_files=(~/.bashrc ~/.zshrc)
for config_file in ${config_files[@]}; do
    # Skip config files that don't exist.
    ! [ -r "${config_file}" ] && continue

    # If we don't have the 'source ~/.shell.d' line in our config, add it.
    source_comment="# Source our 'dotfiles' configuration (github.com/effective-shell/dotfiles)."
    source_command="[ -r ~/.shell.sh ] && source ~/.shell.sh"
    if ! grep -q "${source_command}" "${config_file}"; then
        echo ".shell.sh is not sourced in '${config_file}' adding this now..."
        echo "${source_comment}" >> "${config_file}"
        echo "${source_command}" >> "${config_file}"
    fi
done

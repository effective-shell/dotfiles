#!/usr/bin/env sh

# This script uninstalls the dotfiles locally. Note that it should be run from the
# dotfiles folder so that the links are set properly!

# Fail on errors.
set -e

# Uncomment this line to trace the script commands.
# set -x

# Remove symbollic links for the shell configuration.
rm "$HOME/.shell.sh" || true
rm "$HOME/.shell.d" || true

# Loop through the shell configuration files.
config_files=(~/.bashrc ~/.zshrc)
for config_file in ${config_files[@]}; do
    # Skip config files that don't exist.
    ! [ -r ~/.bashrc ] && continue

    # Remove source comment and source command.
    source_comment="# Source our 'dotfiles' configuration (github.com/effective-shell/dotfiles)."
    source_command="[ -r ~/.shell.sh ] && source ~/.shell.sh"
    grep -v "${source_comment}" "${config_file}" >> "${config_file}.tmp"
    grep -v "${source_command}" "${config_file}" >> "${config_file}"
    echo "removed '.shell.sh' source line from '${config_file}'..."
done

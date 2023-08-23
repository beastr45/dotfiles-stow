#!/usr/bin/bash

echo "Script is running."

# Create the parent directories recursively if they don't exist
mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Script execution complete."

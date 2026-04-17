#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Claude Code global settings
mkdir -p ~/.claude
cp "$DOTFILES_DIR/.claude/settings.json" ~/.claude/settings.json
echo "  ✓ ~/.claude/settings.json"

# Git config
if [ ! -f ~/.gitconfig ]; then
  cp "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
  echo "  ✓ ~/.gitconfig"
else
  echo "  ~ ~/.gitconfig already exists, skipping"
fi

echo "Done!"

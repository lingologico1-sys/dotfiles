#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

# Claude Code global settings
mkdir -p ~/.claude
if [ ! -f ~/.claude/settings.json ] || [ "$(cat ~/.claude/settings.json)" = "{}" ]; then
  cp "$DOTFILES_DIR/.claude/settings.json" ~/.claude/settings.json
  echo "  ✓ ~/.claude/settings.json"
else
  echo "  ~ ~/.claude/settings.json already configured, skipping"
fi

# Git config
if [ ! -f ~/.gitconfig ]; then
  cp "$DOTFILES_DIR/.gitconfig" ~/.gitconfig
  echo "  ✓ ~/.gitconfig"
else
  echo "  ~ ~/.gitconfig already exists, skipping"
fi

echo "Done!"

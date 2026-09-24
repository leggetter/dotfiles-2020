#!/usr/bin/env bash
# Symlink shared agent instructions from dotfiles into each harness's global location.
# Idempotent: re-running is safe. Existing non-matching files are backed up, never deleted.
set -euo pipefail

SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$SRC" != "$HOME/.dotfiles/agents" ]; then
  echo "warn     CLAUDE.md imports @~/.dotfiles/agents/AGENTS.md but this repo is at $SRC" >&2
  echo "         Update the import path in $SRC/CLAUDE.md" >&2
fi

link() {
  local target="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$target" ]; then
    echo "ok       $dest"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="$dest.backup.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "backup   $dest -> $backup"
  fi
  ln -s "$target" "$dest"
  echo "linked   $dest -> $target"
}

# Codex: global instructions (respects CODEX_HOME)
link "$SRC/AGENTS.md" "${CODEX_HOME:-$HOME/.codex}/AGENTS.md"

# Claude Code: user-level instructions, which import AGENTS.md
link "$SRC/CLAUDE.md" "$HOME/.claude/CLAUDE.md"

# Add more harnesses here as needed, e.g.:
# link "$SRC/AGENTS.md" "$HOME/.config/<tool>/AGENTS.md"

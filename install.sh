#!/usr/bin/env bash
# Orkestratör kurulumu: skill'i ve alt agent'ları ~/.claude altına kopyalar.
# Var olan agent dosyalarının üzerine yazmaz; yazmak için: ./install.sh --force
set -euo pipefail

DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
FORCE=0
[[ "${1:-}" == "--force" ]] && FORCE=1

mkdir -p "$CLAUDE_DIR/skills/orkestrator" "$CLAUDE_DIR/agents"
cp "$DIR/skills/orkestrator/SKILL.md" "$CLAUDE_DIR/skills/orkestrator/SKILL.md"

for f in "$DIR"/agents/*.md; do
  hedef="$CLAUDE_DIR/agents/$(basename "$f")"
  if [[ -e "$hedef" && $FORCE -eq 0 ]]; then
    echo "  atlandı (zaten var): $(basename "$f")"
  else
    cp "$f" "$hedef"
    echo "  kuruldu: $(basename "$f")"
  fi
done

cat <<'BANNER'

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
 🎼  Orkestratör kuruldu.
     Claude Code'da /orkestrator yazıp başlat.

     by invviola  ·  github.com/invviola/orkestrator
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
BANNER

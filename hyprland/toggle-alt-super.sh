#!/usr/bin/env bash

set -euo pipefail

state_file="$HOME/.config/hypr/alt-super-swap.state"
state=0
if [[ -f "$state_file" ]] && [[ $(<"$state_file") == "1" ]]; then
  state=1
fi

options="ctrl:nocaps,compose:caps,shift:both_capslock_cancel,grp:alts_toggle"

if (( state == 1 )); then
  printf '0\n' > "$state_file"
  options=${options//,altwin:swap_alt_win/}
  options=${options#altwin:swap_alt_win,}
else
  printf '1\n' > "$state_file"
  options="${options},altwin:swap_alt_win"
fi

hyprctl eval "hl.config({ input = { kb_options = \"$options\" } })"

#!/usr/bin/env bash

set -euo pipefail

options=$(hyprctl getoption input:kb_options -j | jq -r '.str')

if [[ ",$options," == *,altwin:swap_alt_win,* ]]; then
  options=${options//,altwin:swap_alt_win/}
  options=${options#altwin:swap_alt_win,}
else
  options="${options},altwin:swap_alt_win"
fi

hyprctl eval "hl.config({ input = { kb_options = \"$options\" } })"

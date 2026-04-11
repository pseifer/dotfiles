#!/bin/bash

# Version: Angband 4.x
# Resolution: 3440x1440

# Setup:
#     sudo apt install angband xfonts-terminus

ANGBAND_USER_DIR="${HOME}/.angband/Angband"
mkdir -p "$ANGBAND_USER_DIR"

cat >"$ANGBAND_USER_DIR/window.prf" <<EOL

# Use the roguelike command keyset
option:rogue_like_commands:yes
# Use sound
option:use_sound:no
# Show damage player deals to monsters
option:show_damage:no
# Use old target by default
option:use_old_target:no
# Always pickup items
option:pickup_always:no
# Always pickup items matching inventory
option:pickup_inven:yes
# Show flavors in object descriptions
option:show_flavors:yes
# Highlight target with cursor
option:show_target:yes
# Highlight player with cursor between turns
option:highlight_player:no
# Disturb whenever viewable monster moves
option:disturb_near:yes
# Show walls as solid blocks
option:solid_walls:yes
# Show walls with shaded background
option:hybrid_walls:no
# Color: Illuminate torchlight in yellow
option:view_yellow_light:yes
# Color: Shimmer multi-colored things
option:animate_flicker:yes
# Center map continuously
option:center_player:no
# Color: Show unique monsters in purple
option:purple_uniques:yes
# Automatically clear '-more-' prompts
option:auto_more:yes
# Color: Player color indicates % hit points
option:hp_changes_color:yes
# Allow mouse clicks to move the player
option:mouse_movement:no
# Notify on object recharge
option:notify_recharge:no
# Show effective speed as multiplier
option:effective_speed:no

# Catppuccin Mocha — High Contrast Pastel
V:0:0x01:0x00:0x00:0x00
V:1:0x01:0xE8:0xEA:0xFF
V:2:0x01:0x9A:0xA5:0xC8
V:3:0x01:0xFF:0xA0:0x60
V:4:0x01:0xFF:0x6E:0x8A
V:5:0x01:0x7E:0xE8:0x7E
V:6:0x01:0x6A:0xA8:0xFF
V:7:0x01:0xC8:0x96:0x50
V:8:0x01:0x55:0x5A:0x72
V:9:0x01:0xB8:0xC2:0xE0
V:10:0x01:0xD4:0x8F:0xFF
V:11:0x01:0xFF:0xE0:0x6A
V:12:0x01:0xFF:0xB3:0xC6
V:13:0x01:0x5E:0xE8:0xD4
V:14:0x01:0x5C:0xD8:0xFF
V:15:0x01:0xFF:0xCC:0xAA

# Window 'Term-1', Flag 'Display inven/equip'
window:1:0:1

# Window 'Term-2', Flag 'Display equip/inven'
window:2:1:1

# Window 'Term-3', Flag 'Display monster recall'
window:3:8:1

# Window 'Term-3', Flag 'Display object recall'
window:3:9:1

# Window 'Term-4', Flag 'Display monster list'
window:4:10:1

# Window 'Term-5', Flag 'Display messages'
window:5:6:1
EOL

# Fonts setup — Angband uses ANGBAND_X11_FONT_* prefix

export ANGBAND_X11_FONT_0="-xos4-terminus-bold-r-normal--32-320-72-72-c-160-iso8859-1"
export ANGBAND_X11_FONT_1="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export ANGBAND_X11_FONT_2="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export ANGBAND_X11_FONT_3="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export ANGBAND_X11_FONT_4="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export ANGBAND_X11_FONT_5="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export ANGBAND_X11_FONT_6="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"

# Main window
export ANGBAND_X11_AT_X_0=700
export ANGBAND_X11_AT_Y_0=0
export ANGBAND_X11_COLS_0=80
export ANGBAND_X11_ROWS_0=43

# Subwindow 1 : Inventory
export ANGBAND_X11_AT_X_1=0
export ANGBAND_X11_AT_Y_1=0
export ANGBAND_X11_COLS_1=70
export ANGBAND_X11_ROWS_1=72

# Subwindow 2 : Equipment
export ANGBAND_X11_AT_X_2=1982
export ANGBAND_X11_AT_Y_2=0
export ANGBAND_X11_COLS_2=70
export ANGBAND_X11_ROWS_2=17

# Subwindow 3 : Combat Rolls (no equivalent in Angband — use for monster list or messages)
export ANGBAND_X11_AT_X_3=2684
export ANGBAND_X11_AT_Y_3=0
export ANGBAND_X11_COLS_3=75
export ANGBAND_X11_ROWS_3=71

# Subwindow 4 : Recall
export ANGBAND_X11_AT_X_4=1982
export ANGBAND_X11_AT_Y_4=370
export ANGBAND_X11_COLS_4=70
export ANGBAND_X11_ROWS_4=21

# Subwindow 5 : Log
export ANGBAND_X11_AT_X_5=1982
export ANGBAND_X11_AT_Y_5=1200
export ANGBAND_X11_COLS_5=70
export ANGBAND_X11_ROWS_5=30

# -mx11 = X11 frontend
# -n6   = open 6 subwindows
# (no -c needed: Angband defaults to ASCII; use -g for tiles)
angband -mx11 -- -n6


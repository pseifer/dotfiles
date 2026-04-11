#!/bin/bash

# VERSION: Sil-Q 1.5 
# RESOLUTION: 3440x1440 

# TODO Is there a parameter for animation delay?

# SETUP:
#     sudo apt install xfonts-terminus
#     git clone https://github.com/sil-quirk/sil-q/tree/master .silq 
#     sudo apt install gcc cmake ninja-build libncursesw5-dev libx11-dev
#     cmake -G Ninja -B build -DCMAKE_BUILD_TYPE=Release
#     cmake --build build

# Change directory.
cd ~/.silq || exit

cat >lib/user/user.prf <<EOL
# Enable vi movement keys.
Y:hjkl_movement

# Disable ESC opening the main menu.
X:easy_main_menu

# Enable lists on commands.
Y:always_show_list

# Disable dismiss '-more-' and 'y/n' prompts with any key.
X:quick_messages

# Automatically dismiss '-more-' messages.
Y:auto_more

# Disable Audible beep (on errors/warnings).
X:beep

# Option 'Know all monster info'.
Y:know_monster_info

# Setup Window 5 for Message Log.
W:5:2:0
W:5:7:1

# Sil-Q Color Scheme — Catppuccin Mocha (High Contrast Pastel)
# V:<index>:0x01:<red>:<green>:<blue>
# V:0:0x01:0x00:0x00:0x00 # Black
# V:1:0x01:0xE8:0xEA:0xFF # White / main text
# V:2:0x01:0x9A:0xA5:0xC8 # Light grey / floors
# V:3:0x01:0xFF:0xA0:0x60 # Orange / warnings
# V:4:0x01:0xFF:0x6E:0x8A # Red / danger
# V:5:0x01:0x7E:0xE8:0x7E # Green / nature
# V:6:0x01:0x6A:0xA8:0xFF # Blue / magic
# V:7:0x01:0xC8:0x96:0x50 # Brown / bows, torches, wood ← changed
# V:8:0x01:0x55:0x5A:0x72 # Dark grey / shadows
# V:9:0x01:0xB8:0xC2:0xE0 # Light grey bright / secondary text
# V:10:0x01:0xD4:0x8F:0xFF # Purple / special
# V:11:0x01:0xFF:0xE0:0x6A # Yellow / gold
# V:12:0x01:0xFF:0xB3:0xC6 # Pink / wounds
# V:13:0x01:0x5E:0xE8:0xD4 # Teal / exits
# V:14:0x01:0x5C:0xD8:0xFF # Cyan / ice
# V:15:0x01:0xFF:0xCC:0xAA # Peach / wood
EOL

# Fonts setup

export SIL_X11_FONT_0="-xos4-terminus-bold-r-normal--32-320-72-72-c-160-iso8859-1"
export SIL_X11_FONT_1="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export SIL_X11_FONT_2="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export SIL_X11_FONT_3="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export SIL_X11_FONT_4="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export SIL_X11_FONT_5="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"
export SIL_X11_FONT_6="-xos4-terminus-bold-r-normal--20-200-72-72-c-100-iso8859-1"

# Main window.
export SIL_X11_AT_X_0=700
export SIL_X11_AT_Y_0=0
export SIL_X11_COLS_0=80
export SIL_X11_ROWS_0=43

# Subwindow 1 : Inventory
export SIL_X11_AT_X_1=0
export SIL_X11_AT_Y_1=0
export SIL_X11_COLS_1=70
export SIL_X11_ROWS_1=72

# Subwindow 2 : Equipment 
export SIL_X11_AT_X_2=1982
export SIL_X11_AT_Y_2=0
export SIL_X11_COLS_2=70
export SIL_X11_ROWS_2=17

# Subwindow 3 : Combat Rolls
export SIL_X11_AT_X_3=2684
export SIL_X11_AT_Y_3=0
export SIL_X11_COLS_3=75
export SIL_X11_ROWS_3=71

# Subwindow 4 : Recall
export SIL_X11_AT_X_4=1982
export SIL_X11_AT_Y_4=370
export SIL_X11_COLS_4=70
export SIL_X11_ROWS_4=21

# Subwindow 5 : Log
export SIL_X11_AT_X_5=1982
export SIL_X11_AT_Y_5=1200
export SIL_X11_COLS_5=70
export SIL_X11_ROWS_5=30

# Launch with x11 frontend and 6 windows.
./sil -mx11 -- -n6 -c


#!/usr/bin/env python3

import os
import sys
import select
import subprocess
import tty
import termios

# Corresponding desktop entry for ~/.local/share/applications/Tuxbox.desktop,
# for launching alacritty with the respective config, launching this as startup script.
# Alternatively, use 'tuxbox' from the commandline.
# New entries may require: 'update-desktop-database ~/.local/share/applications/'

# [Desktop Entry]
# Type=Application
# Name=Tuxbox
# Comment=Alacritty running launchtux.py
# Exec=sh -c "alacritty --class Tuxbox --config-file ~/.crawlacritty.toml"
# StartupWMClass=Tuxbox
# Icon=input-gaming-symbolic
# Terminal=false
# Categories=System;TerminalEmulator;

# --- Configuration -----------------------------------------------------------

DESKTOP_C       = "DP-1"
DESKTOP_RES     = "3440x1440@99.982"
DESKTOP_FONT    = "26"
DESKTOP_PADDING = "450"

DESKTOP2_C       = "DP-2"
DESKTOP2_RES     = "1920x1080@60.000"

TV_C       = "HDMI-1"
TV_RES     = "1920x1080@60.000"
TV_FONT    = "26"
TV_PADDING = "0"

TV4K_C       = "HDMI-1"
TV4K_RES     = "3840x2160@60.000"
TV4K_FONT    = "53"
TV4K_PADDING = "0"

# --- Utilities ---------------------------------------------------------------

def p(*args, **kwargs):
    print(*args, end='', flush=True, **kwargs)

def color(COLOR, label):
    RESET = '\033[0m'
    return f"{COLOR}{label}{RESET}"

def highlight(label):
    return color('\033[0;32m', label)

def uielem(label):
    return color('\033[0;90m', label)

def print_indent():
    p("  ")

def print_with_key(key, label):
    print_indent()
    p(f"{uielem("[")}{highlight(key)}{uielem("]")} {label}")

def print_with_key_cont(key, label):
    print_indent()
    p(f"{uielem("|")}  {uielem("[")}{highlight(key)}{uielem("]")} {label}")

def print_end_section():
    p("\n\n")

def print_next():
    p("\n")

def print_logo():                      
    print_end_section()
    print_indent()
    p(f"{uielem("[[")}~{highlight("TuxBox")}~{uielem("]]")}")
    print_end_section()

def print_menu():
    print_logo()
    print_with_key("c", "Dungeon Crawl Stone Soup")
    print_with_key_cont("u", "DCSS @ underhound.eu")
    print_with_key_cont("n", "Nethack")
    print_next()
    print_with_key("s", "Steam")
    print_end_section()
    print_with_key("y", "YouTube")
    print_with_key_cont("v", "Twitch")
    print_with_key_cont("b", "Bonjwa")
    print_end_section()
    print_with_key("t", "TV")
    print_with_key_cont("k", "TV4K")
    print_with_key_cont("d", "Desktop")
    print_with_key_cont("a", "Desktop+")
    print_end_section()
    print_with_key("enter", "Terminal")
    print_next()
    print_with_key("esc", "Quit")
    print_end_section()
    print_indent()

def read_char() -> str:
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    try:
        tty.setraw(fd)
        ch = sys.stdin.read(1)
        if ch == '\x1b' and select.select([sys.stdin], [], [], 0.05)[0]:
            ch += sys.stdin.read(2)
        return ch
    finally:
        termios.tcsetattr(fd, termios.TCSADRAIN, old)

# --- Actions -----------------------------------------------------------------

def alacritty(*args: str):
    subprocess.run(["alacritty", "msg", "config", *args],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def update_padding():
    alacritty("window.padding.x=0")
    cols, rows = os.get_terminal_size()
    ratio = cols * 100 // rows
    padding = DESKTOP_PADDING if ratio > 460 else TV_PADDING
    alacritty(f"window.padding.x={padding}")

def set_monitor(connector, res, font, padding):
    subprocess.run(["gnome-monitor-config", "set", "-LpM", connector, "-t", "normal", "-m", res])
    alacritty(f"window.padding.x={padding}", f"font.size={font}")

def tux_term():
    set_monitor(TV_C, TV_RES, TV_FONT, TV_PADDING)

def tux_4k():
    set_monitor(TV4K_C, TV4K_RES, TV4K_FONT, TV4K_PADDING)

def no_tux_term():
    set_monitor(DESKTOP_C, DESKTOP_RES, DESKTOP_FONT, DESKTOP_PADDING)

def no_tux_term2():
    subprocess.run([
        "gnome-monitor-config", "set",
        "-LM",  DESKTOP2_C, "-t", "normal", "-m", DESKTOP2_RES,
        "-x", "0", "-y", "360",
        "-LpM", DESKTOP_C,  "-t", "normal", "-m", DESKTOP_RES,
        "-x", "1920", "-y", "0",
    ])
    alacritty(f"window.padding.x={DESKTOP_PADDING}", f"font.size={DESKTOP_FONT}")


def launch_steam():
    subprocess.Popen(["xdg-open", "steam://open/bigpicture"],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def launch_browser(url: str):
    profile = os.path.expanduser("~/snap/firefox/common/.mozilla/firefox/51gg3zr6.tuxbox")
    subprocess.Popen(["firefox", "--profile", profile, url],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# --- Main loop ---------------------------------------------------------------

ACTIONS = {
    'c':    lambda: subprocess.run(["dcss"]),
    'u':    lambda: subprocess.run(["sshpass", "-p", "terminal", "ssh", "-p", "23", "terminal@underhound.eu"]),
    'n':    lambda: subprocess.run(["nethack"]),
    't':    tux_term,
    'k':    tux_4k,
    'd':    no_tux_term,
    'a':    no_tux_term2,
    's':    launch_steam,
    'y':    lambda: launch_browser("https://youtube.com"),
    'v':    lambda: launch_browser("https://twitch.tv"),
    'b':    lambda: launch_browser("https://twitch.tv/bonjwa"),
    '\r':   lambda: (os.system("clear"), subprocess.run(["zsh"])),
}

def main():
    update_padding()
    while True:
        os.system("clear")
        print_menu()
        ch = read_char()
        if ch == '\x1b':
            sys.exit(0)
        if action := ACTIONS.get(ch):
            action()

if __name__ == "__main__":
    main()


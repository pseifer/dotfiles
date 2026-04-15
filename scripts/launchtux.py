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

class Config:

    desktop_c       = "DP-1"
    desktop_res     = "3440x1440@99.982"
    desktop_font    = "26"
    desktop_padding = "450"

    desktop2_c       = "DP-2"
    desktop2_res     = "1920x1080@60.000"

    tv_c       = "HDMI-1"
    tv_res     = "1920x1080@60.000"
    tv_font    = "26"
    tv_padding = "0"

    tv4k_c       = "HDMI-1"
    tv4k_res     = "3840x2160@60.000"
    tv4k_font    = "53"
    tv4k_padding = "0"

    browser_profile_path = "~/snap/firefox/common/.mozilla/firefox/51gg3zr6.tuxbox"

# --- Utilities I/O -----------------------------------------------------------

def p(*args, **kwargs):
    print(*args, end='', flush=True, **kwargs)

def color(color, label):
    reset = '\033[0m'
    return f"{color}{label}{reset}"

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

def print_action(key: str):
    if action := actions.get(key):
        label = action[0]
    else:
        label = "___"
    print_with_key(key, label)

def print_action_cont(key: str):
    if action := actions.get(key):
        label = action[0]
    else:
        label = "___"
    print_with_key_cont(key, label)

def print_label(label):
    print_indent()
    p(f"{label}")

def print_end_section():
    p("\n\n")

def print_next():
    p("\n")

def print_logo():                      
    print_end_section()
    print_indent()
    p(f"{uielem("[[")}~{highlight("TuxBox")}~{uielem("]]")}")
    print_end_section()

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

def confirm_choice(choice: str, fn):
    while True:
        os.system("clear")
        print_logo()
        print_label(f"Do you really want to {choice}?")
        print_next()
        print_indent()
        print_with_key("y", "yes")
        print_next()
        print_indent()
        print_with_key("n", "no")
        print_end_section()
        print_indent()
        ch = read_char()
        if ch == 'y':
            fn()
            return
        if ch == '\x1b':
            return
        if ch == 'n':
            return

# --- Actions -----------------------------------------------------------------

def alacritty(*args: str):
    subprocess.run(["alacritty", "msg", "config", *args],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def update_padding():
    alacritty("window.padding.x=0")
    cols, rows = os.get_terminal_size()
    ratio = cols * 100 // rows
    padding = Config.desktop_padding if ratio > 460 else Config.tv_padding
    alacritty(f"window.padding.x={padding}")

def set_monitor(connector, res, font, padding):
    subprocess.run(["gnome-monitor-config", "set", "-LpM", connector, "-t", "normal", "-m", res])
    alacritty(f"window.padding.x={padding}", f"font.size={font}")

def tux_term():
    set_monitor(Config.tv_c, Config.tv_res, Config.tv_font, Config.tv_padding)

def tux_4k():
    set_monitor(Config.tv4k_c, Config.tv4k_res, Config.tv4k_font, Config.tv4k_padding)

def no_tux_term():
    set_monitor(Config.desktop_c, Config.desktop_res, Config.desktop_font, Config.desktop_padding)

def no_tux_term2():
    subprocess.run([
        "gnome-monitor-config", "set",
        "-LM",  Config.desktop2_c, "-t", "normal", "-m", Config.desktop2_res,
        "-x", "0", "-y", "360",
        "-LpM", Config.desktop_c,  "-t", "normal", "-m", Config.desktop_res,
        "-x", "1920", "-y", "0",
    ])
    alacritty(f"window.padding.x={Config.desktop_padding}", f"font.size={Config.desktop_font}")


def launch_steam():
    subprocess.Popen(["xdg-open", "steam://open/bigpicture"],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

def launch_browser(url: str):
    profile = os.path.expanduser(BROWSER_PROFILE_PATH)
    subprocess.Popen(["firefox", "--profile", profile, url],
                     stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

# --- Main --------------------------------------------------------------------

actions = {
    'c':    ("Dungeon Crawl Stone Soup", lambda: subprocess.run(["dcss"])),
    'u':    ("DCSS @ underhound.eu", lambda: subprocess.run(["sshpass", "-p", "terminal", "ssh", "-p", "23", "terminal@underhound.eu"])),
    'n':    ("Nethack", lambda: subprocess.run(["nethack"])),
    't':    ("TV", tux_term),
    'k':    ("TV4K", tux_4k),
    'd':    ("Desktop", no_tux_term),
    'a':    ("Desktop+", no_tux_term2),
    's':    ("Steam", launch_steam),
    'S':    ("Suspend system", lambda: confirm_choice("suspend the system", lambda: subprocess.run(["systemctl", "suspend", "-i"]))),
    'y':    ("YouTube", lambda: launch_browser("https://youtube.com")),
    'v':    ("Twitch", lambda: launch_browser("https://twitch.tv")),
    'b':    ("Bonjwa", lambda: launch_browser("https://twitch.tv/bonjwa")),
    '\r':   ("Terminal", lambda: (os.system("clear"), subprocess.run(["zsh"]))),
}

def print_menu():
    print_logo()
    print_action('s')
    print_next()
    print_action('c')
    print_action_cont('u', )
    print_action_cont('n')
    print_end_section()
    print_action('y')
    print_action_cont('v')
    print_action_cont('b')
    print_end_section()
    print_action('t')
    print_action_cont('k')
    print_action_cont('d')
    print_action_cont('a')
    print_end_section()
    print_with_key("enter", "Terminal")
    print_with_key_cont("esc", "Quit")
    print_action_cont('S')
    print_end_section()
    print_indent()

def main():
    update_padding()
    while True:
        os.system("clear")
        print_menu()
        ch = read_char()
        if ch == '\x1b':
            sys.exit(0)
        if action := actions.get(ch):
            action[1]()

if __name__ == "__main__":
    main()


import json
import sys


def extract_terminal_keys(json_file):
    with open(json_file, "r") as file:
        data = json.load(file)
    terminal = {}

    if "themes" in data:
        for theme in data["themes"]:
            if "style" in theme:
                style = theme["style"]
                for key, value in style.items():
                    if key.startswith("terminal"):
                        terminal[key.replace(".", "_")] = value
    return terminal


# Template for an Alacritty color scheme.
template = (
    "[colors.primary]"
    "\nbackground = '{terminal_background}'"
    "\nforeground = '{terminal_foreground}'"
    "\n"
    "\n[colors.normal]"
    "\nblack   = '{terminal_ansi_black}'"
    "\nred     = '{terminal_ansi_red}'"
    "\ngreen   = '{terminal_ansi_green}'"
    "\nyellow  = '{terminal_ansi_yellow}'"
    "\nblue    = '{terminal_ansi_blue}'"
    "\nmagenta = '{terminal_ansi_magenta}'"
    "\ncyan    = '{terminal_ansi_cyan}'"
    "\nwhite   = '{terminal_ansi_white}'"
    "\n"
    "\n[colors.bright]"
    "\nblack   = '{terminal_ansi_bright_black}'"
    "\nred     = '{terminal_ansi_bright_red}'"
    "\ngreen   = '{terminal_ansi_bright_green}'"
    "\nyellow  = '{terminal_ansi_bright_yellow}'"
    "\nblue    = '{terminal_ansi_bright_blue}'"
    "\nmagenta = '{terminal_ansi_bright_magenta}'"
    "\ncyan    = '{terminal_ansi_bright_cyan}'"
    "\nwhite   = '{terminal_ansi_bright_white}'"
)

if __name__ == "__main__":
    terminal_data = extract_terminal_keys(sys.argv[1])
    print(template.format_map(terminal_data))

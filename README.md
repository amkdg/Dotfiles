# My Dotfiles

(Personal) Minimal setup optimized for performance and battery efficiency.
Includes configs for zsh, vim, iTerm and tmux.

![Screenshot 1](https://github.com/amkdg/Dotfiles/blob/main/Screenshots/Screenshot-1.png?raw=true)
![Screenshot 2](https://github.com/amkdg/Dotfiles/blob/main/Screenshots/Screenshot-2.png?raw=true)

## Compatibility & Requirements
Script compatible and tested with macOS 10-12 as well as most Linux distributions. \
Requires `bash` and `python3` to be on `$PATH`

## Installation
1. Clone this repository using `git clone https://github.com/amkdg/Dotfiles.git`
2. Run the script using `bash Dotfiles/install.sh`
3. If you intend to use iTerm, refer to your operating system's manual to install [fonts](https://github.com/amkdg/Dotfiles/tree/main/Fonts) and manually import the [iTerm profile](https://github.com/amkdg/Dotfiles/blob/main/Dotfiles/Other%20(Not%20sourced)/iterm.conf.json) in preferences.

## Updating?
The dotfiles are symlinked, not copied over to your home directory. You can run `git pull` to fetch any changes from this repository or your own fork.

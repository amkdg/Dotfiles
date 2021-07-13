# My Dotfiles

(Personal) Minimal setup optimized for performance and battery efficiency.
Includes configs for zsh, vim, iTerm and tmux.

![Screenshot 1](https://github.com/amkdg/Dotfiles/blob/main/Screenshots/Screenshot-1.png?raw=true)
![Screenshot 2](https://github.com/amkdg/Dotfiles/blob/main/Screenshots/Screenshot-2.png?raw=true)

## Compatibility & Requirements
Script compatible and tested with macOS 10-12 as well as most Linux distributions. \
Requires `bash` and `python3` to be on `$PATH`

## Installation
Please note that this script does not overwrite any existing dotfiles of the same name. Save or remove them manually before running this script.

1. Run
`bash -c "$(curl -fsSL https://raw.githubusercontent.com/amkdg/Dotfiles/main/quickinstall.sh
)"`
2. If you intend to use iTerm, manually import the [iTerm profile](https://github.com/amkdg/Dotfiles/blob/main/Dotfiles/Other%20(Not%20sourced)/iterm.conf.json) in preferences

If that doesn't work, manually clone this repository and run `install.sh`

## Updating?
The dotfiles are symlinked, not copied over to your home directory. You can run `git pull` to fetch any updates from this repository or your own fork.

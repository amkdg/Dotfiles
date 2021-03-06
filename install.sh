# https://github.com/amkdg/Dotfiles

CPUARCH=`arch`  # Get CPU architecture

# macOS stuff
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH

    # Set up homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew analytics off
    brew cleanup
    brew doctor

    /bin/bash Other/brewfile.sh  # Install brew packages
    /bin/bash Other/caskfile.sh  # Install brew casks

    # Set wallpaper
    osascript Wallpaper/osx_set_wallpaper.scpt
    
    # (Try to) Install fonts. 
    cp Fonts/*.otf ~/Library/Fonts
    cp Fonts/*.ttf ~/Library/Fonts

# Linux stuff
elif [[ "$OSTYPE" == "linux"* ]]; then
    packages_to_install = 'python3'

    if ! command -v $packages_to_install; then
        echo "Could not find 1 or more of the following packages: $packages_to_install on your system."
        echo "If you have them, make sure they are on \$PATH\n\n."

        INSTALL_COMMAND=""

        if command -v pacman; then  # Arch btw
            INSTALL_COMMAND="sudo pacman -S $packages_to_install"
        elif command -v apt;  then
            INSTALL_COMMAND="sudo apt install -y $packages_to_install"
        elif command -v dnf;  then
            INSTALL_COMMAND="sudo dnf install -y $packages_to_install"
        elif command -v apk;  then
            INSTALL_COMMAND="sudo apk add $packages_to_install"
        else
            echo "Could not find a working package manager on your system. You must manually install: $packages_to_install"
            exit 1
        fi

        echo "A package manager was found on your system. Would you like to run "$INSTALL_COMMAND"?"
        select yn in "Yes" "No"; do
            case $yn in
            Yes ) /bin/bash -c $INSTALL_COMMAND;;
            No ) echo "Abort."; exit 0;;
            esac
        done
    fi

    # Install the starship command-prompt
    /bin/bash -c "$(curl -fsSL https://starship.rs/install.sh)" -s -f

else
    echo "Unknown operating system $OSTYPE\n Proceed?"
    select yn in "Yes" "No"; do
        case $yn in
            Yes ) break;;
            No ) echo "Abort."; exit 0;;
        esac
    done
fi

# -----------------------------------------------------

python3 dotfiles.py  # Install the actual dotfiles

if command -v code; then
    /bin/bash Other/vscode.sh
fi

if command -v vim && test -f ~/.vimrc; then
    # Setup vundle
    if ! test -d ~/.vim/bundle/Vundle.vim; then
        git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    fi

    # Install plugins using vundle
    grep -v "colorscheme" ~/.vimrc > ~/Desktop/vimrc.temp
    vim -u ~/Desktop/vimrc.temp -c PluginInstall -c qall
    rm -rf ~/Desktop/vimrc.temp
fi


if command -v tmux && test -f ~/.tmux.conf; then
    # Setup tpm
    if ! test -d ~/.tmux/plugins/tpm; then
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
fi

# Install tmux plugins and apply the changes
tmux source-file ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
tmux source-file ~/.tmux.conf


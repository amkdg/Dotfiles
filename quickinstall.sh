# https://github.com/amkdg/Dotfiles

CPUARCH=`arch`  # Get CPU architecture

# macOS stuff
if [[ "$OSTYPE" == "darwin"* ]]; then
    xcode-select --install

mkdir ~/Developer; cd ~/Developer

git clone https://github.com/amkdg/Dotfiles
cd ~/Developer/Dotfiles

bash install.sh

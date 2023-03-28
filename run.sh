#!/bin/bash
# This is a script to quickly setup a new machine

# Fail on error
set -e

# Printing commands and arguments as they are executed
set -x

# Install Homebrew
echo "Installing Homebrew"
if [[ `uname` == 'Linux' ]]; then
    apt-get update && \
    apt-get install sudo && \
    sudo apt install build-essential curl file git
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing ZSH"
# Install ZSH
if [[ `uname` == 'Linux' ]]; then
  sudo apt install zsh && \
    chsh -s $(which zsh)
fi

echo -e  "\e[1;31mInstalling Oh My Zsh, type 'exit' once installed to continue\e[0m"
# Install Oh My zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

echo "Installing Powerlevel10k"
# Install Powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Installing Nerd Fonts"
# Install Nerd Fonts
curl -LO https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip

if [[ `uname` == 'Darwin' ]]; then
 unzip FiraCode.zip
else
    sudo apt install unzip && \
    unzip FiraCode.zip
fi

echo -e "\e[1;31mYour FiraCode Nerd Fonts are located at $pwd, install the ones you consider relevant.\e[0m"

# Prompt asking to install fonts
# read -p "Do you want to install the fonts? (y/n) " -n 1 -r
# 
# if [[ $REPLY =~ ^[Yy]$ ]]
# then
#   if [[ `uname` == 'Darwin' ]]; then
#     open Fira\ Code\ Light\ Nerd\ Font\ Complete\ Mono.ttf
#   else
#     sudo apt-get install --reinstall xdg-utils && \
#     xdg-open Fira\ Code\ Light\ Nerd\ Font\ Complete\ Mono.ttf
#   fi
# else
#     echo "Fonts not installed, please install them manually"
# fi
# 
# # Cleaning up font files and zips
# rm -rf Fira*
# rm LICENSE
# rm readme.md
# rm FiraCode.zip

echo -e "\e[1;31mInstalling Brewfile, this install will fail if run as a root user\e[0m"
# Install Brewfile
read -p "Please enter your dotfiles directory path: " dotfiles

if [[ $dotfiles == "" ]]
then
    if [[ `uname` == 'Linux' ]]; then
        echo "Assuming dotfiles directory is in home directory (~/.dotfiles)"
        cd ~/.dotfiles/brew && \
            /home/linuxbrew/.linuxbrew/bin/brew bundle && \
            cd
    else 
        echo "Assuming dotfiles directory is in home directory (~/.dotfiles)"
        cd ~/.dotfiles/brew && \
            brew bundle && \
            cd
    fi
else
    if [[ `uname` == 'Linux' ]]; then
        cd $dotfiles/brew && \
            /home/linuxbrew/.linuxbrew/bin/brew bundle && \
            cd
    else 
        cd $dotfiles/brew && \
            brew bundle && \
            cd
fi

echo "Installing Oh My Zsh plugins"
# Install Oh My Zsh plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search

# Install Ruby Full
if [[ `uname` == 'Linux' ]]; then
  sudo apt install ruby-full 
fi

echo "Installing Colorls"
# Install Colorls
sudo gem install colorls

# Stow dotfiles
echo "Stowing dotfiles"
stow nvim/ && stow zsh/

if [[ `uname` == 'Linux' ]]; then
    stow i3/ 
else
    stow gpg/
fi

# Source ZSH
echo "Sourcing ZSH"
/bin/zsh -c "source ~/.zshrc" && \
    zsh
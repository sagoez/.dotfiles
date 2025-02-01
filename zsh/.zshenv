# Locale
export LC_ALL=en_US.UTF-8

# GpG agent
export GPG_TTY=$(tty)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# If cargo is installed
if [[ -d "$HOME/.cargo" ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
else
  echo -e "\033[0;31mWARNING: Cargo is not installed\033[0m"
fi

# >>> Homebrew <<<
if [[ `uname` == "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export PATH="$HOME/.local/share/coursier/bin:$PATH"
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/Users/$USER/Library/Application Support/Coursier/bin:$PATH"
    export PATH="/usr/local/bin:$PATH"
fi

export K9S_CONFIG_DIR=~/.config/k9s


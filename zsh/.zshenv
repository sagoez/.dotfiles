# Locale
export LC_ALL=en_US.UTF-8

# GpG agent
export GPG_TTY=$(tty)

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Define GOPATH
export GOPATH="$HOME/Go" # default packages installation path

# IF CARGO AND GO ARE INSTALLED
if [[ -d "$HOME/.cargo" && -d "$HOME/Go" ]]; then
  export GOMODCACHE="$HOME/Go/pkg/mod"
  export PATH="$GOPATH/bin:$HOME/.cargo/bin:$PATH"
else
  echo -e "\033[0;31mWARNING: Cargo and Go are not installed\033[0m"
fi

# >>> eval homebrew <<<
if [[ `uname` == "Linux" ]]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    export PATH="$HOME/.local/share/coursier/bin:$PATH"
else
    eval "$(/opt/homebrew/bin/brew shellenv)"
    export PATH="/Users/$USER/Library/Application Support/Coursier/bin:$PATH"
    # export /usr/local/bin/
    export PATH="/usr/local/bin:$PATH"
fi

if [[ -d "$HOME/.fluvio" ]]; then
  export PATH="${HOME}/.fvm/bin:${HOME}/.fluvio/bin:${PATH}"
fi

export K9S_CONFIG_DIR=~/.config/k9s


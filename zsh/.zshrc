if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/.default.omp.json)"
fi

if [ $(uname) = "Darwin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# Locale
export LC_ALL=en_US.UTF-8

# GpG agent
export GPG_TTY=`tty`
gpgconf --launch gpg-agent

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Add wisely, as too many plugins slow down shell startup.
plugins=( git fast-syntax-highlighting zsh-autosuggestions git-open direnv )

source $ZSH/oh-my-zsh.sh

# User configuration

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
fi

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

source $HOME/.zshalias

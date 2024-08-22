if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/.default.omp.json)"
fi

if [ $(uname) = "Darwin" ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

# GpG agent
gpgconf --launch gpg-agent

plugins=( git fast-syntax-highlighting zsh-autosuggestions git-open direnv )

source $ZSH/oh-my-zsh.sh

# User configuration
if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
fi

[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

source $HOME/.zshalias

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ $(uname) = "Darwin" ]; then
    # >>> Homebrew <<<
    export PATH="/opt/homebrew/bin:$PATH"
fi


# Locale
export LC_ALL=en_US.UTF-8

# GpG agent
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add wisely, as too many plugins slow down shell startup.
plugins=( git zsh-syntax-highlighting zsh-autosuggestions git-open )

source $ZSH/oh-my-zsh.sh

# User configuration

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ -x "$(command -v colorls)" ]; then
    alias ls="colorls"
    alias la="colorls -al"
fi

if [ -x "$(command -v bat)" ]; then
    alias cat="bat"
fi


# >>> Java version manager <<<
[ -s "$HOME/.jabba/jabba.sh" ] && source "$HOME/.jabba/jabba.sh"

# >>> Source aliases <<<
source $HOME/.aliases

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/samuel/Evolution/google-cloud-sdk/path.zsh.inc' ]; then . '/home/samuel/Evolution/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/samuel/Evolution/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/samuel/Evolution/google-cloud-sdk/completion.zsh.inc'; fi

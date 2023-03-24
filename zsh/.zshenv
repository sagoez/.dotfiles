. "$HOME/.cargo/env"
export GOPATH="$HOME/go" # default packages installation path

# >>> eval homebrew <<<
if [[ `uname` == "Linux" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
else 
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

export PATH="$GOPATH/bin:$HOME/.cargo/bin:$PATH:/Users/$USER/Library/Application Support/Coursier/bin"


. "$HOME/.cargo/env"
export GOPATH="$HOME/go" # default packages installation path

# >>> eval homebrew <<<
eval "$(/opt/homebrew/bin/brew shellenv)"


export PATH="$GOPATH/bin:$HOME/.cargo/bin:$PATH:/Users/$USER/Library/Application Support/Coursier/bin"


. "$HOME/.cargo/env"
export GOPATH="$HOME/go" # default packages installation path

export PATH="$GOPATH/bin:$PATH"

# Prepending path in case a system-installed rustc needs to be overridden

export PATH="$HOME/.cargo/bin:$PATH"

# >>> coursier install directory <<<
export PATH="$PATH:/Users/$USER/Library/Application Support/Coursier/bin"

# >>> eval homebrew <<<
eval "$(/opt/homebrew/bin/brew shellenv)"

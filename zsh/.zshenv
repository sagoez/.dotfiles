. "$HOME/.cargo/env"
# >>> golang path export <<<

case ":${PATH}:" in
    *:"$HOME/go/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed rustc needs to be overridden
        export PATH="$HOME/.cargo/bin:$PATH"
        ;;
esac

# >>> coursier install directory <<<
export PATH="$PATH:/Users/$USER/Library/Application Support/Coursier/bin"

# >>> eval homebrew <<<
eval "$(/opt/homebrew/bin/brew shellenv)"

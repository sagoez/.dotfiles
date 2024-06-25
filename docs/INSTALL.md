# Install

## Arch Linux

### Installation
1. Clone the repository to `~/.dotfiles`

2. Run

```bash
yay -Sy git curl file stow blueman
```

3. Install `brew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. Install `zsh`

```bash
yay zsh && zsh
```

5. Install `oh my zsh`

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

6. Install FiraCode Nerd

```bash
sudo pacman -S ttt-firacode-nerd
```

7. Install `Powerlevel10k`

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

8. Install `Brewfile`

```bash
cd ~/.dotfiles/brew && brew bundle
```

9. Install `fast-syntax-highlighting`

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

10. Install `zsh-autosuggestions`

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

11. Install `git-open`

```bash
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

12. Install `ruby`

```bash
sudo pacman -S ruby
```

13. Install `colorls`

```bash
sudo gem install colorls
```

14. Install jabba

```bash
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.17-0
jabba alias default openjdk@1.17.0
```

15. Setup coursier

```bash
coursier setup
brew uninstall --ignore-dependencies java
```

16. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow hypr
```

17. Download and install the following programs:

```bash
Spotify
Discord
Slack
Docker
```

# MacOS

### Installation

1. Run pertinent steps from previous Linux block
2. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh
```

# Troubleshooting

- [Git GPG signing fails without a clear message](https://stackoverflow.com/questions/52444915/git-gpg-signing-fails-without-a-clear-message)
- [How to understand the `gpg failed to sign the data` problem in git](https://gist.github.com/paolocarrasco/18ca8fe6e63490ae1be23e84a7039374)
- [GPG Suite, new key failed permission denied](https://gpgtools.tenderapp.com/discussions/feedback/17657-install-os-x)
- [GPG Suite on MacOS](https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65)
- [Handling multiple Git identities](https://gist.github.com/Jonalogy/54091c98946cfe4f8cdab2bea79430f9)

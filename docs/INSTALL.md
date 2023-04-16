# Install

## Linux

### Installation

1. Clone the repository to `~/.dotfiles`

2. Run

```bash
apt-get install update && apt-get install -y build-essential git curl file
```

3. Install `brew`

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. Install `zsh`

```bash
sudo apt install zsh && chsh -s $(which zsh)
```

5. Install `oh my zsh`

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

6. Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip)

7. Install `Powerlevel10k`

```bash
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

8. Install `Brewfile`

```bash
cd ~/.dotfiles/brew && brew bundle
```

9. Install `zsh-syntax-highlighting`

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

10. Install `zsh-autosuggestions`

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

11. Install `git-open`

```bash
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

11. Install `ruby`

```bash
sudo apt install ruby-full
```

12. Install `colorls`

```bash
sudo gem install colorls
```

13. Install i3

```bash
sudo apt install i3
```

14. Install jabba

```bash
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.17-0
```

15. Setup coursier

```bash
coursier setup
```

16. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow i3
```

## MacOS

### Installation

1. Run steps 1-3-5-6-7-8-9-10-11-12-14-15 from the Linux installation
2. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow gpg
```
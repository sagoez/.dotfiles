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

6. Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip)

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
jabba alias default openjdk@1.17.0
```

15. Setup coursier

```bash
coursier setup
brew uninstall --ignore-dependencies java
```

16. Install kitty

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/sbin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop

```
17. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow i3
```


## Optionally on Ubuntu to personalise your wm

17. Install `feh`

```bash
sudo apt install feh
```

18. Remove `iLock`

```bash
sudo apt remove i3lock
```

19. Install `i3lock-color`

```bash
git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
./install-i3lock-color.sh
```

20. Install theme

```bash
sudo apt install materia-gtk-theme papirus-icon-theme
```

21. Install `lxappearance`

```bash
sudo apt install lxappearance
```

22. Type `lxappearance`

```bash
lxappearance
```

23. Install `picom`

```bash
sudo apt install picom
```

24. Install `fonts-droid-fallback`

```bash
sudo apt install fonts-droid-fallback
```

25. Install `pavucontrol`

```bash
sudo apt install pavucontrol
```



# MacOS

### Installation

1. Run steps 1-3-5-6-7-8-9-10-11-12-14-15 from the Linux installation
2. Stow folders

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow gpg
```

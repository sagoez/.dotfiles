# Install

## MacOS

1. Clone the repository to `~/.dotfiles`:

```bash
git clone https://github.com/sagoez/.dotfiles.git ~/.dotfiles
```

2. Install [Homebrew](https://brew.sh/):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip)

4. Install `Brewfile`

```bash
cd ~/.dotfiles/brew && brew bundle
```

5. Install jabba and setup coursier:

```bash
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.17-0
jabba alias default openjdk@1.17.0
coursier setup
brew uninstall --ignore-dependencies java
```

6. Install `oh my zsh`

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

7. Install `fast-syntax-highlighting`

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

8. Install `zsh-autosuggestions` and `git clone`

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

9. Install cargo:

```bash
curl https://sh.rustup.rs -sSf | sh
```

10. Install colorls:

```bash
sudo gem install colorls
```

11. Stow the folders:

```bash
stow nvim && stow zsh && stow k9s && stow kitty && stow aerospace
```

12. Make sure you have created the following directories:

```bash
mkdir ~/Go/ && mkdir ~/Work/ && mkdir ~/Learning/
```

13. Install kitty:

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

14. Install atuin:

```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

15. Install applications [MacOS]:

- 1Password
- Postman
- Google Chrome
- Spotify
- Slack
- Bartender 5
- Shottr
- Discord
- Structured
- Spark Mail
- Idea Toolbox (IntelliJ & Datagrip)
- Docker Desktop

## Linux

### Installation
1. Clone the repository to `~/.dotfiles`:

```bash
git clone https://github.com/sagoez/.dotfiles.git ~/.dotfiles
```

2. Install necessary packages:

```bash
sudo apt-get install -y build-essential git curl file stow blueman acpi libusb-1.0-0 libusb-1.0-0-dev shutter
```

3. Install `homebrew`:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

4. Install `zsh`:

```bash
sudo apt install zsh && chsh -s $(which zsh)
```

5. Install `oh my zsh`:

```bash
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

6. Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip)

8. Install `Brewfile`:

```bash
cd ~/.dotfiles/brew && brew bundle
```

9. Install `fast-syntax-highlighting`:

```bash
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git \
  ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```

10. Install `zsh-autosuggestions`:

```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

11. Install `git-open`:

```bash
git clone https://github.com/paulirish/git-open.git $ZSH_CUSTOM/plugins/git-open
```

11. Install `ruby`:

```bash
sudo apt install ruby-full
```

12. Install `colorls`:

```bash
sudo gem install colorls
```

13. Install i3:

```bash
sudo apt install i3 picom polybar feh pavucontrol rofi
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
sudo apt install ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
rm keyring.deb
sudo apt upgrade
```

14. Install jabba:

```bash
curl -sL https://github.com/shyiko/jabba/raw/master/install.sh | bash && . ~/.jabba/jabba.sh
jabba install openjdk@1.17-0
jabba alias default openjdk@1.17.0
```

15. Setup coursier:

```bash
coursier setup
brew uninstall --ignore-dependencies java
```

### Post i3 installation

16. Install kitty:

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten /usr/local/sbin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```

17. Install cargo:

```bash
curl https://sh.rustup.rs -sSf | sh
```

18. Make sure you have created the following directories:

```bash
mkdir ~/Go/ && mkdir ~/Work/ && mkdir ~/Learning/
```

19. Install atuin:
```bash
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
```

20. Install applications [Linux]:

- Slack
- Spotify
- Google Chrome
- Postman
- Docker Desktop
- Idea Toolbox (IntelliJ & Datagrip)
- Discord


21. Stow folders:

```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow k9s && stow kitty && stow i3
```

# Troubleshooting

- [Git GPG signing fails without a clear message](https://stackoverflow.com/questions/52444915/git-gpg-signing-fails-without-a-clear-message)
- [How to understand the `gpg failed to sign the data` problem in git](https://gist.github.com/paolocarrasco/18ca8fe6e63490ae1be23e84a7039374)
- [GPG Suite, new key failed permission denied](https://gpgtools.tenderapp.com/discussions/feedback/17657-install-os-x)
- [GPG Suite on MacOS](https://gist.github.com/danieleggert/b029d44d4a54b328c0bac65d46ba4c65)
- [Handling multiple Git identities](https://gist.github.com/Jonalogy/54091c98946cfe4f8cdab2bea79430f9)

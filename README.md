# Dotfiles

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

6. Install `Powerlevel10k`
```bash 
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
```

7. Install [Nerd Fonts](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/FiraCode.zip)

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

11. Install `ruby`
```bash
sudo apt install ruby-full
```

12. Install `colorls` 
```bash
sudo gem install colorls
```

13. Stow folders 
```bash
cd ~/.dotfiles && stow nvim && stow zsh && stow i3
```

## MacOS

### Installation

1. Run steps 1-3-5-6-7-8-9-10-11-12 from the Linux installation
2. Stow folders 
```bash 
cd ~/.dotfiles && stow nvim && stow zsh && stow gpg
```


## Bundle

This is a list of what the `Brewfile` installs, some of them are not needed but I like to have them around. The ones
that are needed are marked with a `*`.

- git-lfs [*]: Git Large File Storage (LFS) replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git.
- neovim [*]: Vim-fork focused on extensibility and agility.
- gnupg [*] -> MacOS only: GnuPG is a complete and free implementation of the OpenPGP standard
- harfbuzz [*] -> MacOS only: HarfBuzz is a text shaping engine. It primarily supports OpenType, but also Apple Advanced Typography, Graphite2, and Uniscribe.
- jq [*]: Command-line JSON processor
- librdkafka: Apache Kafka C/C++ library
- kcat: Apache Kafka producer and consumer
- kubernetes-cli: Kubernetes command-line interface
- lua-language-server [*]: Lua language server
- node [*]: Node.js JavaScript runtime
- parallel: GNU Parallel is a shell tool for executing jobs in parallel using one or more processors.
- pinentry-mac [*] -> MacOS only: Pinentry for GnuPG using native Mac OS X dialogs
- podman: Podman is a daemonless, open source, Linux native tool designed to make it easy to find, run, build, share and deploy applications using Open Containers Initiative (OCI) Containers and Container Images.
- podman-compose: An implementation of Compose Spec with Podman backend.
- python@3.10 [*]: Python programming language
- ripgrep [*]: ripgrep recursively searches directories for a regex pattern
- rust-analyzer [*]: Rust analyzer
- yaml-language-server: YAML language server
- derailed/k9s/k9s: K9s is a terminal based UI to interact with your Kubernetes clusters.
- amethyst (MacOS): Amethyst is a tiling window manager for macOS that models many of its concepts after i3.
- conduktor (MacOS): Conduktor is a modern Kafka Desktop Client.

**Recommended [linux]**: If you're using i3 I highly recommend using [rofi](https://github.com/davatorium/rofi) and/or [xfce4-appfinder](https://gitlab.xfce.org/xfce/xfce4-appfinder) for apps and [pavucontrol](https://freedesktop.org/software/pulseaudio/pavucontrol/) for sound, since getting used to app names can be a bit hard at the beginning.  

**Note**: In case of running into issues such as `module packer not found` or whatever, go to the `packer.lua` file and remove everything but packer and run `:so` and `:PackerInstall` again. This will make sure that packer is installed correctly. Later on, you can add the plugins back.

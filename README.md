# NVIM Configuration

To make sure that the configuration works, you need to install the following:

Once downloaded, you need to install the plugins. To do so, run the following command:

```bash
brew bundle
```

This will install all the plugins that are needed for the configuration to work.

## Plugins

- git-lfs
- neovim
- gnupg
- harfbuzz
- jq
- librdkafka
- kcat
- kubernetes-cli
- lua-language-server
- node
- parallel
- pinentry-mac (MacOS)
- podman
- podman-compose
- python@3.10
- ripgrep
- rust-analyzer
- yaml-language-server
- derailed/k9s/k9s
- amethyst (MacOS)
- conduktor (MacOS)

**Recommended [linux]**: If you're using i3 I highly recommend using [rofi](https://github.com/davatorium/rofi) and/or [xfce4-appfinder](https://gitlab.xfce.org/xfce/xfce4-appfinder), since getting used to app names can be a bit hard at the beginning.  

**Note**: In case of running into issues such as `module packer not found` or whatever, go to the `packer.lua` file and remove everything but packer and run `:so` and `:PackerInstall` again. This will make sure that packer is installed correctly. Later on, you can add the plugins back.

# NVIM Configuration

To make sure that the configuration works, you need to install the following:

- [ripgrep] `brew install ripgrep`
- [rust-analyzer] `brew install rust-analyzer`
- [lua-language-server] `brew install lua-language-server`
- [node] `brew install node`

**Note**: In case of running into issues such as `module packer not found linux` or whatever, go to the `packer.lua` file and remove everything but packer and run `:PackerSync` again. This will make sure that packer is installed correctly. Later on, you can add the plugins back.

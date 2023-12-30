# Neovim configuration

You can install [Neovim from here](https://github.com/neovim/neovim).

## Before installation

You need to setup your own `~/.vimrc` file. This Neovim configuration starts with loading the `.vimrc` file.

See `lua/config/vim.lua`:

```lua
vim.cmd([[source ~/.vimrc]])
```

## Installation

```shell
# Linux or macOS
git clone https://github.com/Galacsh/neovim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# Windows (CMD)
git clone https://github.com/Galacsh/neovim-config.git %userprofile%\AppData\Local\nvim\

# Windows (PowerShell)
git clone https://github.com/Galacsh/neovim-config.git $env:USERPROFILE\AppData\Local\nvim\
```

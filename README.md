# Neovim extension for [C++ Insights](https://github.com/andreasfertig/cppinsights)

[![readthedocs](https://shields.io/readthedocs/cppinsights-nvim)](https://cppinsights-nvim.readthedocs.io)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/Freed-Wu/cppinsights.nvim/main.svg)](https://results.pre-commit.ci/latest/github/Freed-Wu/cppinsights.nvim/main)
[![github/workflow](https://github.com/Freed-Wu/cppinsights.nvim/actions/workflows/main.yml/badge.svg)](https://github.com/Freed-Wu/cppinsights.nvim/actions)

[![github/downloads](https://shields.io/github/downloads/Freed-Wu/cppinsights.nvim/total)](https://github.com/Freed-Wu/cppinsights.nvim/releases)
[![github/downloads/latest](https://shields.io/github/downloads/Freed-Wu/cppinsights.nvim/latest/total)](https://github.com/Freed-Wu/cppinsights.nvim/releases/latest)
[![github/issues](https://shields.io/github/issues/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/issues)
[![github/issues-closed](https://shields.io/github/issues-closed/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/issues?q=is%3Aissue+is%3Aclosed)
[![github/issues-pr](https://shields.io/github/issues-pr/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/pulls)
[![github/issues-pr-closed](https://shields.io/github/issues-pr-closed/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/pulls?q=is%3Apr+is%3Aclosed)
[![github/discussions](https://shields.io/github/discussions/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/discussions)
[![github/milestones](https://shields.io/github/milestones/all/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/milestones)
[![github/forks](https://shields.io/github/forks/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/network/members)
[![github/stars](https://shields.io/github/stars/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/stargazers)
[![github/watchers](https://shields.io/github/watchers/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/watchers)
[![github/contributors](https://shields.io/github/contributors/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/graphs/contributors)
[![github/commit-activity](https://shields.io/github/commit-activity/w/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/graphs/commit-activity)
[![github/last-commit](https://shields.io/github/last-commit/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/commits)
[![github/release-date](https://shields.io/github/release-date/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/releases/latest)

[![github/license](https://shields.io/github/license/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim/blob/main/LICENSE)
[![github/languages](https://shields.io/github/languages/count/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)
[![github/languages/top](https://shields.io/github/languages/top/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)
[![github/directory-file-count](https://shields.io/github/directory-file-count/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)
[![github/code-size](https://shields.io/github/languages/code-size/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)
[![github/repo-size](https://shields.io/github/repo-size/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)
[![github/v](https://shields.io/github/v/release/Freed-Wu/cppinsights.nvim)](https://github.com/Freed-Wu/cppinsights.nvim)

[![luarocks](https://img.shields.io/luarocks/v/Freed-Wu/cppinsights.nvim)](https://luarocks.org/modules/Freed-Wu/cppinsights.nvim)

Like [cppinsights.vim](https://github.com/Freed-Wu/cppinsights.vim).
However, it contains a lua module of cppinsights, without dependency of
cppinsights.

## Dependence

- llvm
- clang

```sh
# ArchLinux
sudo pacman -S clang llvm llvm-libs
# Nix
# use nix-shell to create a virtual environment then build
```

## Install

### rocks.nvim

#### Command style

```vim
:Rocks install cppinsights.nvim
```

#### Declare style

`~/.config/nvim/rocks.toml`:

```toml
[plugins]
"cppinsights.nvim" = "scm"
```

Then

```vim
:Rocks sync
```

or:

```sh
$ luarocks --lua-version 5.1 --local --tree ~/.local/share/nvim/rocks install cppinsights.nvim
# ~/.local/share/nvim/rocks is the default rocks tree path
# you can change it according to your vim.g.rocks_nvim.rocks_path
```

### lazy.nvim

```lua
require("lazy").setup {
  spec = {
    { "Freed-Wu/cppinsights.nvim", lazy = false },
  },
}
```

## Configure

Refer
[config.lua](https://cppinsights-nvim.readthedocs.io/en/latest/modules/lua.cppinsights.config.html):

```lua
require('cppinsights.nvim').setup({
    -- ...
})
```

## Usage

```vim
:Insights[!] ...
```

- `!` will display diff result.
- `...` is arguments.

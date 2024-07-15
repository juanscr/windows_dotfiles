# My Windows Dotfiles
As I have always used Arch Linux and Window Tilling Managers on my own, when I
moved for working for Microsoft using Windows again was a challenge. In this
documentation, you'll find everything that I did and all my dotfiles for my
Windows installation in order to make it as similar as possible for maximizing
performance.

## Programs
First, as a package manager I use [scoop](https://github.com/ScoopInstaller/Scoop).
After installing `scoop` I install the following programs through it:

- `neovim`: Text command line editor. For my installation to work, it must also
be installed `zig` and `node` for treesitter support.
- `git`: Version control.
- `sudo`: Sudo for windows.
- `eza`: Ls but in Rust.

Additionally, through the windows store I install:

- [Power Toys](https://github.com/microsoft/PowerToys): Windows system utilities for power users.

# Manaul Setup Instructions

## Basic Software

* Firefox
* Bitwarden

### Firefox

Extensions:
* Bitwarden
* Dark Reader
* uBlock Origin
* Tridactyl

Settings:
* Ctrl+Tab cycles through tabs in recently used order

## Basic CLI Software

```bash
sudo apt update

sudo apt install git
sudo apt install make
sudo apt install gcc
sudo apt install neovim
sudo apt install tmux
# Fuzzy finder:
sudo apt install fzf
# Better cat:
sudo apt install bat
# Better grep:
sudo apt install ripgrep
# Better find:
sudo apt install fd-find
```

## SSH certificates

TODO

## Neovim Config

### Egsthe Config

[egst/nvim-config](https://github.com/egst/nvim-config)

```bash
git clone https://github.com/egst/nvim-config ~/.config/nvim

# For use with sudo:
sudo ln -s ~/.config/nvim /root/.config/nvim
```

### Vim Plug

[junegunn/vim-plug](https://github.com/junegunn/vim-plug)

```bash
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim
:PlugInstall
:qa

# For use with sudo:
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sudo nvim
:PlugInstall
:qa
```

## Bash Config

### Egsthe Config

[egst/bash-config](https://github.com/egst/bash-config)

```bash
git clone https://github.com/egst/bash-config ~/.config/bash
```

```bash
# Add to ~/.bashrc what is needed:
source ~/.config/bash/general
source ~/.config/bash/locations
source ~/.config/bash/paths
source ~/.config/bash/aliases
source ~/.config/bash/fzf
source ~/.config/bash/git
```

TODO: Simplify this process.

## Nerd Font

[Nerd Fonts](https://www.nerdfonts.com/font-downloads)

Good tried fonts:
* Hasklug
* FiraCode
* CascaydiaCove

## Gnome Terminal

* Set up custom font (nerd font).
* Hide scroll bar.

## Docker

TODO

## TODO

* Bitwarden CLI (https://github.com/bitwarden/cli)
* Only use nvim extensions if they are installed.
* Create git config repo.
* Create tmux config repo.
* Find terminal alternative (that supports ligatures).
* Setup tridactyl.

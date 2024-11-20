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

## NVM, NodeJS, NPM

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
source ~/.bashrc
nvm install node
```

```bash
npm config set prefix '~/.local/'
```

## SSH certificates

TODO

## Neovim

```bash
# To install latest versions that are not available via apt:
cd ~/Downloads
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# For use with sudo:
sudo ln -s /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
# Alternatively, add it to path (doesn't work with sudo):
export PATH="$PATH:/opt/nvim-linux64/bin"
```

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

### LSP

```bash
npm install -g intelephense
```

## Bash Config

### Egsthe Config

[egst/bash-config](https://github.com/egst/bash-config)

```bash
git clone https://github.com/egst/bash-config ~/.config/bash
```

```bash
# Add to ~/.bashrc:
source ~/.config/bash/general
source ~/.config/bash/locations
source ~/.config/bash/paths
source ~/.config/bash/aliases
source ~/.config/bash/fzf
source ~/.config/bash/git

# Add to ~/.profile:
source ~/.config/bash/profile
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

## Alacritty (Optional)

```bash
sudo apt install alacritty

# Install themes:
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```

```toml
# In ~/.config/alacritty/alacritty.toml:
import = [
    "~/.config/alacritty/themes/themes/deep_space.toml"
]

[window]
decorations = "None"

[font]
normal = {family = "Hasklug Nerd Font", style = "Regular"}
bold   = {family = "Hasklug Nerd Font", style = "Bold"}
italic = {family = "Hasklug Nerd Font", style = "Italic"}
```

To set up a less ugly icon:

```
# In /usr/share/applications/Alacritty.desktop:
Icon=org.gnome.Terminal
```

### Ligatures (Optional)

A fork of Alacrity that supports ligarures: [zenixls2/alacritty](https://github.com/zenixls2/alacritty)

```bash
sudo apt install cmake
sudo apt install cargo

cd ~/Downloads
git clone https://github.com/zenixls2/alacritty

cd alacritty
git checkout ligature
cargo build --release

# Backup the existing binary:
sudo mv /usr/bin/alacritty /usr/bin/alacritty.bak

sudo cp ./target/release/alacritty /usr/bin
```

## Docker

TODO

## Disable Wayland (Optional)

```bash
# In /etc/gdm3/custom.conf uncomment:
WaylandEnable=false
```

Note: It looks like xclip must be installed again after switching to X.

```bash
sudo apt install xclip
```

Then reboot.

## Swap Keys (Optional)

```
# Find out the id of the built-in keybaord:
xinput -list | grep -i key
> ↳ AT Translated Set 2 keyboard id=16 [slave keyboard (3)]

# Swap caps lock for escape:
setxkbmap -device 16 -option caps:swapescape
# Swap left control for alt:
setxkbmap -device 16 -option ctrl:swap_lalt_lctl
```

TODO: Currently set up in bash config in the general and profile files.
I don't know what's the best place to put this setup.
It doesn't seem to work reliably in neither bashrc nor profile.
Also, this will only work with a fixed built-in keyboard ID.

Note: This doesn't work with Wayland.

## PHP (Optional)

## TODO

* Bitwarden CLI (https://github.com/bitwarden/cli)
* Only use nvim extensions if they are installed.
* Create git config repo.
* Create tmux config repo.
* Create alacritty config repo.
* Find terminal alternative (that supports ligatures).
* Setup tridactyl.

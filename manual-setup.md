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

* git
* make
* gcc
* tmux
* fzf (fuzzy finder)
* bat (better cat)
* ripgrep (better gret)
* fd-find (better fint)

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
# PHP Intelephense:
npm install -g intelephense

# TypeScript:
npm install -g typescript typescript-language-server

# ES Lint:
npm i -g vscode-langservers-extracted
```

## Dotfiles (bash, git, tmux)

Dotfiles with basic configurations are provided in this repo in `dotfiles/`.
Link them to the home directory manually.

## Nerd Font

[Nerd Fonts](https://www.nerdfonts.com/font-downloads)

Good tried fonts:
* Hasklug
    * Ligatures
* FantasqueSans
    * Ligatures: Ligatures for >= and better ligature for ===.
* FiraCode
    * Ligatures
* CascaydiaCove
    * Ligatures
* InconsolataGo

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
sudo apt install pkg-config sudo apt install libfontconfig1-dev
sudo apt install libxcb1-dev libxcb-render0-dev libxcb-shape0-dev libxcb-xfixes0-dev

cd ~/Downloads
git clone https://github.com/zenixls2/alacritty

cd alacritty
git checkout ligature
cargo build --release

# Backup the existing binary:
sudo mv /usr/bin/alacritty /usr/bin/alacritty.bak

sudo cp ./target/release/alacritty /usr/bin
```

This form uses YAML instead of TOML for configuration.
Copy `alacrity.toml` to `alacrity.yml`, convert to YAML and do the same for the needed theme files.

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

## TypeScript (Optional)

## TODO

* Bitwarden CLI (https://github.com/bitwarden/cli)
* Only use nvim extensions if they are installed.
* Create git config repo.
* Create tmux config repo.
* Create alacritty config repo.
* Find terminal alternative (that supports ligatures).
* Setup tridactyl.

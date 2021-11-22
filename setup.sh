#!/bin/sh

# install paru
sudo pacman -Sy --needed base-devel
sudo pacman -S git
git clone https://aur.archlinux.org/paru.git
cd paru
sudo makepkg -si
cd ..
rm -rf paru

# install some utils
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
paru -S fzf bat exa neovim ranger fd ripgrep npm

# install fish & fisher
paru -S fish fisher
fisher install jethrokuan/z PatrickF1/fzf.fish
chsh -s /usr/bin/fish

# copy .config
cp -r config/* ~/.config
rm -rf config/


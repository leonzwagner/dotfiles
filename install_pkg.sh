#!/bin/bash

#List packages
packages=(
  alacritty
  bspwm 
  dunst 
  nitrogen
  picom
  polybar
  rofi
  zathura
  sxhkd
  lazygit
  lazydocker
  neovim
  wezterm
  tmux
  xorg-server
  htop
  curl
)

# Installing all packages list 
for package in "${packages[@]}"; do
    echo "installing $package..."
    sudo pacman -S --noconfirm "$package"
done

echo "all packages done!!"

#!/bin/sh

if ! command -v brew >/dev/null 2>&1
then
    echo "[!] brew is needed"
    exit 1
fi

if ! command -v alacritty >/dev/null 2>&1
then
    echo "[+] alacritty"
    brew install alacritty
fi

if ! command -v fastfetch >/dev/null 2>&1
then
    echo "[+] fastfetch (eyecandy is important 🍬😤)"
    brew install fastfetch
fi

echo "[+] alacritty config files"

alacritty_dir="$HOME/.config/alacritty"
if [ -d "$alacritty_dir" ]; then
    rm -rf  "$alacritty_dir"
fi

ln -s "$PWD/alacritty" "$alacritty_dir"

if ! command -v fish >/dev/null 2>&1
then
    echo "[+] fish"
    brew install fish
fi

if [[ $SHELL != *"fish"* ]]; then
    echo "[*] setting fish as user login shell"

    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
fi

echo "[+] fish config files"

fish_dir="$HOME/.config/fish"
fish_config="config.fish"
if [ -d "$fish_dir" ]; then
    rm -f "$fish_dir/$fish_config"
else
    mkdir "$fish_dir"
fi

ln -s "$PWD/fish/$fish_config" "$fish_dir/$fish_config"

fish $PWD/fish/install.plugins.fish

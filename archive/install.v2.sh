#!/bin/bash

echo Installing software
echo *******************

echo Installing Homebrew
echo -------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo Installing terminal dependencies
echo -----------------
brew install imagemagick
brew install node
brew install luarocks
brew install cmake
brew install rg

echo Installing Inconsolata Font
echo ---------------------
brew tap homebrew/cask-fonts
brew install font-inconsolata-nerd-font

echo Installing JetBrains Mono Font
echo ---------------------
brew install font-jetbrains-mono-nerd-font

echo Installing Monaspice Font
echo ---------------------
brew install font-monaspace-nerd-font

echo Installing Meslo LG Font
echo ---------------------
brew install font-meslo-lg-nerd-font

echo Installing Fish Shell
echo ---------------------
brew install fish
which fish
sudo sh -c 'echo /usr/local/bin/fish >> /etc/shells'
chsh -s /usr/local/bin/fish

echo Installing NeoVim
echo -----------------
brew install nvim

echo Installing Alacritty terminal
echo -------------------------
brew install alacritty

echo Setting configuration
echo *********************

echo NeoVim - MarkdownPreview dependencies
echo *************************************
cd .local/share/nvim/lazy/markdown-preview.nvim
npm install

echo Copying NeoVim configuration
echo ----------------------------
mkdir ~/.config/nvim
cp -r neovim/* ~/.config/nvim/

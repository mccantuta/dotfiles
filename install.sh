echo Installing software
echo *******************

echo Installing terminal dependencies
echo -----------------
brew install imagemagick
brew install node
brew install luarocks
brew install cmake
brew install rg

echo Installing Inconsolata Font
echo ---------------------
brew install font-inconsolata

echo Installing Oh My Zsh
echo --------------------
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo Installing NeoVim
echo -----------------
brew install nvim

echo Installing Kitty terminal
echo -------------------------
brew install --cask kitty

echo Setting configuration
echo *********************

echo Copying Kitty configuration
echo ---------------------------
cp kitty/* ~/.config/kitty/

echo Copying OhMyZsh configuration
echo -----------------------------
cp ohmyzsh/.zshrc ~/

echo Copying NeoVim configuration
echo ----------------------------
mkdir ~/.config/nvim
cp neovim/* ~/.config/nvim/

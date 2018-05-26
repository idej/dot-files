#!/bin/zsh

echo "Installing:"
echo "- iTerm2"
brew cask install iterm2 > /dev/null

echo "- NeoVim"
{
  brew install neovim python
  pip2 install neovim
  pip3 install neovim
} > /dev/null

echo "- the Fuck"
brew install thefuck > /dev/null

echo "- jq"
brew install jq > /dev/null

echo "- tmux"
brew install tmux > /dev/null

echo "- the silver searcher"
brew install the_silver_searcher > /dev/null

echo "- prezto"
git submodule update --init --recursive > /dev/null

ln -vsf $PWD/prezto ~/.zprezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "- global configs"
for f in global_configs/*; do
  ln -s "$PWD/$f" "${ZDOTDIR:-$HOME}/.${f:t}"
done

echo "- nvim config"
mkdir ~/.config/nvim/
ln -s "$PWD/vimrc" ~/.config/nvim/init.vim

#source code pro and droid nerd fonts
{
  brew tap caskroom/fonts
  brew cask install font-source-code-pro
  cd ~/Library/Fonts
  curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
  cd -
} > /dev/null


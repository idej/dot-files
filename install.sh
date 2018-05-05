#!/bin/zsh

echo "Installing:"
echo "- iTerm2"
brew cask install iterm2 > /dev/null

echo "- NeoVim"
brew install neovim > /dev/null

echo "- tmux"
brew install tmux > /dev/null

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
ln -s "$PWD/vimrc" ~/.config/nvim/init.vim

#source code pro and hack nerd fonts
{
  brew tap caskroom/fonts
  brew cask install font-source-code-pro
  brew cask install font-hack-nerd-font
} > /dev/null


#!/bin/sh
#
# Vim

set -e

# Check for Vim
if test $(which vim)
then
  echo '  Installing node for CoC.'
  brew install node
  echo '  Installing CoC extensions.'
  coc_extensions='coc-json coc-html coc-go coc-jedi' # coc-java
  vim -esN +"CocInstall -sync $coc_extensions | q" +qall
  echo '  Installing helptags'
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-commentary/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-fugitive/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/coc.nvim/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/nerdtree/doc/' +qall
fi

exit 0

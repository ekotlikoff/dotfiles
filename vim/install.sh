#!/bin/sh
#
# Vim

set -e

# Check for Vim
if test $(which vim)
then
  echo '  installing node for CoC'
  brew install node
  echo '  installing CoC extensions'
  coc_extensions='coc-json coc-html coc-go coc-jedi' # coc-java
  vim -esN +"CocInstall -sync $coc_extensions | q" +qall
  echo '  installing helptags'
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/coc.nvim/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-fugitive/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-vinegar/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-eunuch/doc' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-commentary/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-speeddating/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugin/start/vim-surround/doc/' +qall
fi

exit 0

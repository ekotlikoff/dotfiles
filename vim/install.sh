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
  for plugin in $(find -H "$HOME/.vim/pack/plugin/start/" -maxdepth 2 -name 'doc'); do
    vim -esN +"helptags $plugin" +qall
  done
fi

exit 0

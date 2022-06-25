#!/bin/sh
#
# Vim

set -e

# Check for Vim
if test $(which vim)
then
  echo '  Installing CoC.'
  brew install node
  vim -esN +'helptags $HOME/.vim/pack/plugins/start/coc.nvim/doc/' +qall
  vim -esN +'helptags $HOME/.vim/pack/plugins/start/nerdtree/doc/' +qall
  echo '  Installing CoC extensions.'
  coc_extensions='coc-json coc-html coc-go coc-jedi' # coc-java
  vim -esN +"CocInstall -sync $coc_extensions | q" +qall

  # Run GoInstallBinaries vim command (provided by
  # https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) to install Go
  # tool binaries under g:go_bin_path.
  # echo '  Running GoInstallBinaries'
  # vim -esN +GoInstallBinaries +qall
fi

exit 0

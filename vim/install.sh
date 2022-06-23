#!/bin/sh
#
# Vim

# Check for Vim
if test $(which vim)
then
  echo "  Installing GO binaries for you."
  # Run GoInstallBinaries vim command (provided by
  # https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) to install Go
  # tool binaries under g:go_bin_path.
  echo "Running GoInstallBinaries"
  vim -esN +GoInstallBinaries +qall
fi

exit 0

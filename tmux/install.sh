#!/bin/sh

if test ! $(which tmux)
then
  echo "  installing tmux for you"
  brew install tmux
fi

exit 0

#!/bin/sh

if test ! $(which alacritty)
then
  echo "  installing Alacritty for you"
  brew install alacritty
fi

exit 0

#!/bin/sh
#
# Alacritty

# Check for Alacritty
if test ! $(which alacritty)
then
  echo "  Installing Alacritty for you."
  brew install alacritty
fi

exit 0

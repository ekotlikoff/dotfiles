#!/bin/bash

tools="tldr fzf ripgrep glow"
for tool in $tools; do
  if test ! $(which $tool)
  then
    echo "  installing $tool for you"
    brew install "$tool"
  fi
done

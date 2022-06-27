#!/bin/bash

tools="tldr fzf"
for tool in $tools; do
  echo "  checking $tool"
  if test ! $(which $tool)
  then
    echo "  installing $tool for you"
    brew install "$tool"
  fi
done

#!/bin/bash

if test ! $(which tldr)
then
  echo "  installing tldr for you"
  brew install tldr
fi

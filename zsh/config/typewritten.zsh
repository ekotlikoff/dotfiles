if [ "$DOT_TYPE" != 'corp' ]; then
  fpath+=$DOT/zsh/plugin/typewritten
  autoload -U promptinit; promptinit
  prompt typewritten
  TYPEWRITTEN_CURSOR="block"
fi

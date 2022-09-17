export PATH="/usr/local/bin:/usr/local/sbin:$DOT/bin:$PATH"

export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"

if [ -f "$HOME/.cargo/env" ]
then
  source "$HOME/.cargo/env"
  export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/library
fi

#!/usr/bin/env bash

dependencies=("zsh" "vim" "tmux")

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    *)          machine="UNKNOWN:${unameOut}"
esac
echo "OS detected: ${machine}"
if [ "${machine}" == "Mac" ]; then
    if [ -x "$(command -v brew)" ]; then
        for dep in "${dependencies[@]}"; do
            echo "Installing $dep"
            brew install "$dep"
        done
    fi
    if [[ "$SHELL" != "$(which zsh)" ]]; then
        echo "Configuring zsh as default shell"
        grep -qxF "$(which zsh)" /etc/shells || echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
        chsh -s "$(which zsh)"
    fi
elif [ "${machine}" == "Linux" ]; then
    if [ -x "$(command -v apt-get)" ]; then
        dependencies="sudo $dependencies"
        for dep in "${dependencies[@] "sudo"}"; do
            echo "Installing $dep"
            sudo apt-get --assume-yes install "$dep"
        done
        if [[ "$SHELL" != "$(which zsh)" ]]; then
            echo "Configuring zsh as default shell"
            grep -qxF "$(which zsh)" /etc/shells || echo "$(which zsh)" | sudo tee -a /etc/shells > /dev/null
            chsh -s "$(which zsh)"
        fi
        echo "Bootstrapping complete"
    else
        echo "TODO: dnf not implemented"
        #dnf install vim
    fi
elif [ "${machine}" == "Cygwin" ]; then
    echo "Please be sure that the following dependencies are installed:"
    printf '%s\n' "${dependencies[@]}"
    echo "Additionally the following cygwin specific packages should be installed:"
    echo "git, openssh, python3."
    echo "To run zsh as the default shell, set the following environment variable"
    echo "in windows settings: SHELL = /usr/bin/zsh"
else
    echo "Unknown OS"
fi

# Create undo directory for persistent undo.
mkdir ~/.vim/undo

# Run GoInstallBinaries vim command (provided by
# https://github.com/fatih/vim-go/blob/master/doc/vim-go.txt) to install Go
# tool binaries under g:go_bin_path.
echo "Running GoInstallBinaries"
vim -esN +GoInstallBinaries +qall

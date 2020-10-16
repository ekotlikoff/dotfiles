#!/usr/bin/env bash

dependencies=("zsh" "vim")

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
    echo "Not yet implemented"
elif [ "${machine}" == "Linux" ]; then
    if [ -x "$(command -v apt-get)" ]; then
        for dep in "${dependencies[@]}"; do
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
    echo "Additionally the following cygwin specific packages should be installed: git, openssh, python3."
    echo "Unfortunately I'm unsure how to run zsh in cygwin"
else
    echo "Unknown OS"
fi


if grep -Fxq "/bin/zsh" /etc/shells
then
    echo "zsh is already installed"
else
    echo "Installing zsh"
    sudo apt-get --assume-yes install zsh
    echo "/bin/zsh" | sudo tee -a /etc/shells
    chsh -s /bin/zsh
fi


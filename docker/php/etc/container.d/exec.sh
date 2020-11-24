#!/bin/sh

# we're adding it here because /home/app is bound to volume
if [[ ! -d ~/.oh-my-zsh ]] ; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    cp /etc/home_prototype/.zshrc /home/app/.zshrc
fi

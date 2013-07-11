#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup. 

# Install nvm: node-version manager
# https://github.com/creationix/nvm
sudo apt-get install -y git-core
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install vim so that you can edit code and stuff
sudo apt-get install vim

# Install spf13 vim for a bunch of goodies, customization is done below by
# replacing default .vimrc files with ones from my github account
curl http://j.mp/spf13-vim3 -L -o - | sh

# Install screen -- already installed on EC2 instances by default?

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old

git clone https://github.com/mkessy/dotfiles.git

ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .

ln -sb dotfiles/.vimrc
ln -sb dotfiles/.vimrc.local 
ln -sb dotfiles/.vimrc.bundles
ln -sb dotfiles/.vimrc.bundles.local

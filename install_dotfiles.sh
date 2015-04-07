#!/usr/bin/env bash
# This is my expanded version of Lion Krischer's script found at https://github.com/krischer/dotfiles
# It also includes some environmental changes to suit Arch.  
# If one was sone inclined it'd be trivial to create a more universal script.
# Remember files MUST BE IN ~/.dotfiles for the script to work correctly.

if [ `pwd` != $HOME/.dotfiles ]
    then
        echo "ERROR: Working directory for running the install script has to be ~/.dotfiles!"
        exit 1
fi

# First step is to init and update all submodules
git submodule update --init --recursive

# Update any potential old files.
NOW=`date +"%FT%T"`
for DIR in ~/.zshrc ~/.vimrc ~/.vim ~/.tmux ~/.pylintrc ~/.astylerc ~/.gitignore_global ~/.tmux.conf ~/.config/mpd ~/.config/termite ~/.config/powerline ~/powerline.conf
do
    mv $DIR ${DIR}.$NOW
done

# Symlink all zsh files.
ln -s -f -v `pwd`/zsh/zshrc ~/.zshrc

# Symlink termite config.
ln -s -f -v `pwd`/termite ~/.config/termite

# Symlink the vim files.
ln -s -f -v `pwd`/vim/vimrc ~/.vimrc
ln -s -f -v `pwd`/vim ~/.vim
ln -s -f -v `pwd`/eclim ~/.eclim

# Symlink the tmux files
ln -s -f -v `pwd`/tmux ~/.tmux
ln -s -f -v `pwd`/tmux/tmux.conf~/.tmux.conf

# Symlink the powerline files
ln -s -f -v `pwd`/powerline ~/.config/powerline
ln -s -f -v `pwd`/powerline/powerline.conf ~/powerline.conf

# Symlink the mpd files
ln -s -f -v `pwd`/mpd ~/.config/mpd

# All the misc rc files
ln -s -f -v `pwd`/misc_rc_files/pylintrc ~/.pylintrc
ln -s -f -v `pwd`./misc_rc_files/astylerc ~/.astylerc

# Link git stuff
ln -s -f -v `pwd`/git/gitignore_global ~/.gitignore_global

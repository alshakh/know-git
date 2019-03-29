#!/bin/bash

DEMOHOME=~/presentation-demos

rm ./demos
ln -s $DEMOHOME ./demos

echo "MAKE SURE TO CHANGE REFERENCES TO SHELL HOME IN public/index.html"

cd $DEMOHOME || exit 1

# shell home
rm -rf shell-home
mkdir shell-home
cat > shell-home/.bashrc <<MSG
export PS1="\e[95m$\e[0m "
export EDITOR=vim
export VISUAL=vim
MSG

# demo1
rm -rf demo1
mkdir demo1




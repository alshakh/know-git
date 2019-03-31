#!/bin/bash

DEMOHOME=~/presentation-demos

rm ./demos
ln -s $DEMOHOME ./demos

cd $DEMOHOME || exit 1

# shell home
rm -rf shell-home
mkdir shell-home
cat > shell-home/.bashrc <<MSG
export PS1="\e[95m-----$\e[0m "
export EDITOR=vim
export VISUAL=vim
MSG

# simple-history

rm -rf simple-history
mkdir simple-history


# simple-collaboration

rm -rf simple-collaboration
mkdir simple-collaboration
mkdir simple-collaboration/remote.git
mkdir simple-collaboration/person-1
mkdir simple-collaboration/person-2

pushd simple-collaboration/person-1
git init .
echo "echo hello" >> hello.sh
chmod +x hello.sh
git add -A
git commit --message "add hello file" --author "Morgan Freeman <Morgan@git.com>"
echo "echo world" >> hello.sh
git add -A
git commit --message "add world" --author "Morgan Freeman <Morgan@git.com>"
popd

# history branches

rm -rf hb
mkdir hb

pushd hb
git init .
echo "echo hello" >> hello.sh
chmod +x hello.sh
git add -A
git commit --message "add hello file" --author "Morgan Freeman <Morgan@git.com>"
echo "echo world" >> hello.sh
git add -A
git commit --message "add world" --author "Morgan Freeman <Morgan@git.com>"
popd



# collaboration branches

rm -rf cb
mkdir cb
mkdir cb/local
mkdir cb/remote.git

pushd cb/local
git init .

echo "echo hello" >> hello.sh
chmod +x hello.sh
git add -A
git commit --message "add hello file" --author "Morgan Freeman <Morgan@git.com>"

echo "echo world" >> hello.sh
git add -A
git commit --message "add world" --author "Morgan Freeman <Morgan@git.com>"

git branch dynamic
git checkout dynamic

echo "echo hello $@" >> greet.sh
git add -A
git commit --message "dynamic" --author "Morgan Freeman <Morgan@git.com>"

echo "echo hello $@, Nice to see you!" > greet.sh
git add -A
git commit --message "add 'nice to see you!'" --author "Morgan Freeman <Morgan@git.com>"

git checkout master

popd


pushd cb/remote.git
git init . --bare

popd


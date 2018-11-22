#!/bin/bash

VERSION=2.0.2

# install dependencies
apt update
apt install flex bison libcurses-dev librealine-dev

# download bird
wget -O bird.tar.gz ftp://bird.network.cz/pub/bird/bird-$VERSION.tar.gz

tar xvzf bird.tar.gz

cd bird-$VERSION

./configure

make -j4
make install

cd ..

cp -r etc/bird /etc/
cp lib/systemd/system/* /lib/systemd/system/

useradd bird

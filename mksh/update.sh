#!/bin/sh
# Update mksh repository script

git clone https://aur.archlinux.org/mksh.git sources
cd sources
makepkg

cd ..
rm -rfv x86_64/*
mv sources/*.pkg.tar.zst x86_64/
rm -rfv sources/

cd x86_64
repo-add mksh.db.tar.xz mksh-*.pkg.tar.zst

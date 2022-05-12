#!/bin/sh
# Update jtbx-aur repository script

autocommit="true" # Automatically commit and push to GitHub?

sudo printf "" # So you don't get prompted mid-way

alias clone="git clone"

pkgmake() { 
	cd "$1" && makepkg -r --noconfirm $2
	cd ..
}

# Getting sources
mkdir sources
cd sources
clone https://aur.archlinux.org/librewolf-bin.git
clone https://aur.archlinux.org/schildichat-desktop-bin.git
clone https://aur.archlinux.org/lf.git
clone https://aur.archlinux.org/nsxiv.git
clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono.git

# Patching librewolf-bin's PKGBUILD so the package's name is librewolf, not librewolf-bin
# I had too much trouble compiling it
cd librewolf-bin
sed -i 's/pkgname=librewolf-bin/pkgname=librewolf/' PKGBUILD
sed -i '1 s/^/name=librewolf-bin\n/' PKGBUILD
cd ..

# SchildiChat didn't compile either, so I'm also patching that PKGBUILD
cd schildichat-desktop-bin
sed -i 's/pkgname=schildichat-desktop-bin/pkgname=schildichat-desktop/' PKGBUILD
cd ..

# Building packages; line 7
pkgmake librewolf-bin
pkgmake schildichat-desktop-bin
pkgmake lf
pkgmake nsxiv
pkgmake nerd-fonts-jetbrains-mono

cd ..
rm -rfv x86_64/
mkdir x86_64
mv sources/*/*.pkg.tar.zst x86_64/
rm -rf sources/

cd x86_64
repo-add jtbx-aur.db.tar.xz *.pkg.tar.zst
cd ../..

[ "$autocommit" = "true" ] && git add * && git commit -m "[AutoCommit] Updated jtbx-aur repository" && git push

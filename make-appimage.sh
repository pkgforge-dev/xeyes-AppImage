#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q xorg-xeyes | awk '{print $2; exit}')
export ARCH VERSION
export OUTPATH=./dist
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ALWAYS_SOFTWARE=1

# Deploy dependencies
quick-sharun /usr/bin/xeyes

# Turn AppDir into AppImage
quick-sharun --make-appimage

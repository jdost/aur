#!/bin/sh

cd $GITHUB_WORKSPACE/$1
makepkg -si --n
echo "::set-output name=package=$1/$(ls *pkg..tar.xz)"

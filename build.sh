#!/bin/sh

set -euo pipefail

PKG_PATH=${1:-}
if [[ ! -z "$PKG_PATH" ]]; then
   if [[ ! -d "$PKG_PATH" ]]; then
      echo "$PKG_PATH does not exist..."
      exit 1
   fi
   cd $PKG_PATH
fi

sudo chown -R $UID .
namcap PKGBUILD
makepkg -si --noconfirm

PKG_NAME=$(ls *.pkg.tar.xz)
echo "::set-output name=path=$PKG_PATH/$PKG_NAME"
echo "::set-output name=name=$PKG_NAME"

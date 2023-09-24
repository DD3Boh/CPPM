#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

target="${1}"

case "$target" in
  "app")
    ;;
  "plasmoid")
    ;;
  *)
    echo "Invalid target!"
    exit 1
    ;;
esac

echo "Building and installing CPPM..."
echo " "

if [[ ! -d out/ ]]; then
	cmake -DCMAKE_BUILD_TYPE=Release -S "$target" -B "out/$target"
fi
sudo cmake --build "out/$target" --target install

echo " "
echo "Installation finished!"
echo " "
echo "Run \`systemctl enable cppm\` to enable the systemd service."

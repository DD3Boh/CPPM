#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

pkgPath="$1"

echo "Installing CPPM..."
echo " "

echo "Installing packages..."
if [ ! -d extract ]; then
	mkdir extract
fi
sudo tar -xzvf "$1" --strip-components=1 -C /

echo " "
echo "Installation finished!"
echo " "
echo "Run \`systemctl enable cppm\` to enable the systemd service."

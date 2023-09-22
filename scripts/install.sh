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
sudo tar -xzvf "$1" --strip-components=1 -C /usr

echo "Creating system files..."
if [ ! -d /opt/cppm ]; then
	sudo mkdir -m 777 /opt/cppm
fi

if [ ! -s /opt/cppm/mode ]; then
	install -m 666 /dev/null /opt/cppm/mode
fi

echo " "
echo "Installation finished!"
echo " "
echo "Run \`systemctl enable cppm\` to enable the systemd service."

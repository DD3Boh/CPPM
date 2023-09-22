#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

pkgPath="$1"

echo "Removing system files..."
if [ -d /opt/cppm ]; then
	sudo rm -rf /opt/cppm
fi

if [ -d "/usr/share/cppm/" ]; then
	sudo rm -rf "/usr/share/cppm/"
fi

echo "Resetting Power profile to balanced..."
sudo systemctl start cppm.service

echo "Disabling systemd entries..."
sudo systemctl stop cppm.service cppm.path
sudo systemctl disable cppm

echo "Uninstalling..."
sudo rm -v $(tar -tf "$1" | grep -v '/$' | sed 's|^[^/]*/|/|')

echo " "
echo "Uninstall finished!"

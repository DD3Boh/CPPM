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
  "plasma")
    ;;
  *)
    echo "Invalid target!"
    exit 1
    ;;
esac

echo "Removing system files..."
if [ -d /opt/cppm ]; then
	sudo rm -rf /opt/cppm
fi

if [ -d "/usr/share/cppm/" ]; then
	sudo rm -rf "/usr/share/cppm/"
fi

echo "Resetting Power profile to balanced..."
sudo systemctl start cppm.service

echo "Uninstalling CPPM..."
sudo systemctl stop cppm.service cppm.path
sudo systemctl disable cppm

sudo cmake --build "out/$target" --target uninstall

echo " "
echo "Uninstall finished!"

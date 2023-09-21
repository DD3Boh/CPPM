#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

echo "Removing system files..."
if [ -d /opt/cppm ]; then
	sudo rm -rf /opt/cppm
fi

echo "Resetting Power profile to balanced..."
sudo systemctl start cppm.service

echo "Uninstalling CPPM..."
sudo systemctl stop cppm.service cppm.path
sudo systemctl disable cppm

cmake -DCMAKE_BUILD_TYPE=Release -S ./ -B out/
sudo cmake --build out/ --target uninstall

echo " "
echo "Uninstall finished!"

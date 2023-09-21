#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

echo "Uninstalling CPPM..."
echo " "

sudo systemctl disable cppm

cmake -DCMAKE_BUILD_TYPE=Release -S ./ -B out/
sudo cmake --build out/ --target uninstall

echo "Removing system files..."
if [ -d /opt/cppm ]; then
	sudo rm -rf /opt/cppm
fi

echo " "
echo "Uninstall finished!"

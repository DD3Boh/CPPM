#!/bin/bash

#
#  SPDX-FileCopyrightText 2023 Davide Garberi <dade.garberi@gmail.com>
#
#  SPDX-License-Identifier: LGPL-2.1-or-later
#

echo "Building and installing CPPM..."
echo " "

cmake -DCMAKE_BUILD_TYPE=Release -S ./ -B out/
sudo cmake --build out/ --target install

echo "Creating system files..."
if [ ! -d /opt/cppm ]; then
	sudo mkdir -m 777 /opt/cppm
fi
install -m 666 /dev/null /opt/cppm/mode

echo " "
echo "Installation finished!"
echo " "
echo "Run \`systemctl enable cppm\` to enable the systemd service."
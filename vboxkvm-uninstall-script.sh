#!/bin/bash

echo "Remove depencies"


sudo apt -y remove libqt6statemachine6 liblzf-dev
				 
sudo apt -y autoremove

echo "Remove usb rules"

sudo groupdel vboxusers

sudo rm -r /usr/lib/virtualbox	 



sudo rm /etc/udev/rules.d/60-vboxusb.rules

sudo systemctl reload systemd-udevd


echo "Remove Virtualbox from /usr/share directory and remove symlinks"

sudo rm -r /usr/share/virtualbox

sudo rm /usr/bin/virtualbox

sudo rm /usr/share/applications/virtualbox.desktop

sudo rm /usr/bin/VBoxManage

echo "Uninstallation ready"

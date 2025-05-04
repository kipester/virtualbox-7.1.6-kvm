#!/bin/bash

echo "System update and install depencies"

sudo apt update && sudo apt -y upgrade && sudo apt -y autoremove

sudo apt -y install libqt6gui6 libqt6widgets6 libqt6widgets6 libqt6printsupport6 libqt6statemachine6 \
				 libqt6xml6 libqt6help6 libqt6help6 liblzf-dev

echo "Make usb to work.."

sudo groupadd -r vboxusers -U $(whoami)

sudo mkdir /usr/lib/virtualbox	 

sudo cp virtualbox-7.1.6-kvm/VBoxCreateUSBNode.sh /usr/lib/virtualbox/

sudo chown -R root:vboxusers /usr/lib/virtualbox

sudo cat <<EOF > /etc/udev/rules.d/60-vboxusb.rules
SUBSYSTEM=="usb_device", ACTION=="add", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh $major $minor $attr{bDeviceClass}"
SUBSYSTEM=="usb", ACTION=="add", ENV{DEVTYPE}=="usb_device", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh $major $minor $attr{bDeviceClass}"
SUBSYSTEM=="usb_device", ACTION=="remove", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh --remove $major $minor"
SUBSYSTEM=="usb", ACTION=="remove", ENV{DEVTYPE}=="usb_device", RUN+="/usr/lib/virtualbox/VBoxCreateUSBNode.sh --remove $major $minor"
EOF

sudo systemctl reload systemd-udevd


echo "Copy Virtualbox to /usr/share directory and making symlinks"

sudo cp -r virtualbox-7.1.6-kvm /usr/share/virtualbox

sudo ln -s /usr/share/virtualbox/VirtualBox /usr/bin/virtualbox

sudo ln -s /usr/share/virtualbox/virtualbox.desktop /usr/share/applications/

sudo ln -s /usr/share/virtualbox/VBoxManage /usr/bin

echo "Installation ready"

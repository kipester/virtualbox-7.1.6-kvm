# Virtualbox-7.1.6-kvm
My own, not official development repository for Debian Trixie Virtualbox-7.1.6 with KVM backend

Originally forged from https://github.com/cyberus-technology/virtualbox-kvm

Tested on Debian 13 Trixie AMD and Intel 64-bit platforms. Full of bugs, but working and usable for testing. Mainly networking issues, which you can find explanation from cyberus-technologys site.

Quick start:

Do all next steps in your home folder.

Download from releases:

```
wget https://github.com/kipester/virtualbox-7.1.6-kvm/releases/download/Test/virtualbox-7.1.6-kvm.tar.bz2
```
Extract:
```
tar xf virtualbox-7.1.6-kvm.tar.bz2
```
Copypaste installscript from here: https://github.com/kipester/virtualbox-7.1.6-kvm/blob/main/vboxkvm-install-script.sh
```
nano vboxkvm-install-script.sh
```
Save with ctrl +x

Give file execution rights:
```
chmod +x vboxkvm-install-script.sh
```
Run the script:
```
./vboxkvm-install-script.sh
```
There is also uninstall-script here: https://github.com/kipester/virtualbox-7.1.6-kvm/blob/main/vboxkvm-uninstall-script.sh

Which you can use same way as install-script above.

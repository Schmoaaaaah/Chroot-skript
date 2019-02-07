#!/bin/bash
sudo apt-get install schroot -y
sudo apt-get install debootstrap -y
sudo rm -r /var/chroot
mkdir /var/chroot
mkdir /etc/schroot/
cd /etc/schroot
echo [cosmic] >> schroot.conf
echo description=Ubuntu Cosmic >> schroot.conf
echo location=/var/chroot >> schroot.conf
echo priority=3 >> schroot.conf
echo users=noah >> schroot.conf
echo groups=sbuild >> schroot.conf
echo root-groups=root >> schroot.conf
sudo debootstrap --variant=buildd --arch i386 cosmic /var/chroot/ http://debian.charite.de/ubuntu/
sudo mount -o bind /proc /var/chroot/proc
sudo cp /etc/resolv.conf /var/chroot/etc/resolv.conf







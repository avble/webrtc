#!/bin/sh

sudo apt-get install qemu-user-static debootstrap
sudo debootstrap --arch armhf --foreign --include=g++,libasound2-dev,libpulse-dev,libudev-dev,libexpat1-dev,libnss3-dev,libgtk2.0-dev,libc6-dev wheezy rootfs
sudo cp /usr/bin/qemu-arm-static rootfs/usr/bin/
sudo chroot rootfs /debootstrap/debootstrap --second-stage
find rootfs/usr/lib/arm-linux-gnueabihf -lname '/*' -printf '%p %l\n' | while read link target
do
    sudo ln -snfv "../../..${target}" "${link}"
done
find rootfs/usr/lib/arm-linux-gnueabihf/pkgconfig -printf "%f\n" | while read target
do
    sudo ln -snfv "../../lib/arm-linux-gnueabihf/pkgconfig/${target}" rootfs/usr/share/pkgconfig/${target}
done

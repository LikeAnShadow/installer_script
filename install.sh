#!/bin/bash
# Prüfe, welche Pakete installiert sind
installed_packets=""
echo "Prüfe, ob Pakete installiert sind.\n"
! dpkg -s build-essential > /dev/null && installed_packets="build-essential " && echo "build-essential nicht installiert!"
[ "$( dpkg -l | grep mtools )"  = "" ] && installed_packets="${installed_packets}mtools " && echo "mtools nicht installiert!"
[ "$( dpkg -l | grep grub-pc-bin )"  = "" ] && installed_packets="${installed_packets}grub-pc-bin " && echo "grub-pc-bin nicht installiert!"
[ "$( dpkg -l | grep gdb )"  = "" ] && installed_packets="${installed_packets}gdb " && echo "gdb nicht installiert!"
[ "$( dpkg -l | grep ddd )"  = "" ] && installed_packets="${installed_packets}ddd " && echo "ddd nicht installiert!"
[ "$( dpkg -l | grep nasm )"  = "" ] && installed_packets="${installed_packets}nasm " && echo "nasm nicht installiert!"
[ "$( dpkg -l | grep qemu-system-x86 )"  = "" ] && installed_packets="${installed_packets}qemu-system-x86 " && echo "qemu-system-x86 nicht installiert!"
[ "$( dpkg -l | grep xorriso )"  = "" ] && installed_packets="${installed_packets}xorriso " && echo "xorriso nicht installiert!"
[ "$( dpkg -l | grep git )"  = "" ] && installed_packets="${installed_packets}git " && echo "git nicht installiert!"
sudo apt -y install $installed_packets
git clone https://github.com/likeanshadow/oostubs_changed
cd oostubs_changed
make qemu

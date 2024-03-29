#!/bin/bash
# Prüfe, welche Pakete installiert sind
WARN='\033[1;31;40m'
ALL_OK='\033[1;32;40m'
NORMAL='\033[0m'
installed_packets=""
echo "Prüfe, ob Pakete installiert sind."
echo -ne "${WARN}"
[ "$( dpkg -l | grep build-essential )"  = "" ] && installed_packets="build-essential " && echo "build-essential nicht installiert!"
[ "$( dpkg -l | grep mtools )"  = "" ] && installed_packets="${installed_packets}mtools " && echo "mtools nicht installiert!"
[ "$( dpkg -l | grep grub-pc-bin )"  = "" ] && installed_packets="${installed_packets}grub-pc-bin " && echo "grub-pc-bin nicht installiert!"
[ "$( dpkg -l | grep gdb )"  = "" ] && installed_packets="${installed_packets}gdb " && echo "gdb nicht installiert!"
[ "$( dpkg -l | grep ddd )"  = "" ] && installed_packets="${installed_packets}ddd " && echo "ddd nicht installiert!"
[ "$( dpkg -l | grep nasm )"  = "" ] && installed_packets="${installed_packets}nasm " && echo "nasm nicht installiert!"
[ "$( dpkg -l | grep qemu-system-x86 )"  = "" ] && installed_packets="${installed_packets}qemu-system-x86 " && echo "qemu-system-x86 nicht installiert!"
[ "$( dpkg -l | grep xorriso )"  = "" ] && installed_packets="${installed_packets}xorriso " && echo "xorriso nicht installiert!"
[ "$( dpkg -l | grep git )"  = "" ] && installed_packets="${installed_packets}git " && echo "git nicht installiert!"
echo -ne "${NORMAL}"
if ! [ -z "$installed_packets" ]; then
  sleep 5
  sudo apt update
  sudo apt -y install $installed_packets
else
  echo -e "${ALL_OK} Alle Pakete bereits installiert! ${NORMAL}"
  sleep 5
fi
git clone https://github.com/likeanshadow/oostubs_changed
cd oostubs_changed
make qemu

#!/usr/bin/env bash
source $HOME/ArchTitus/setup.conf

echo -ne "
Automated Programming Software Installer Script
Made By Monzim

-------------------------------------------------------------------------
Installing Flutter from official repository...
"
echo ""
cd ~
echo " > Cloning Flutter SDK"
echo ""
git clone https://github.com/flutter/flutter.git -b stable
echo ""
echo " > Adding Flutter PATH:`pwd`/flutter/bin"
export PATH="$PATH:`pwd`/flutter/bin"
echo " > Post install FLutter"
echo ""
flutter doctor
echo ""
echo " > Flutter Install Complete"

echo -ne "
Automated Programming Software Installer Script
Made By Monzim
-------------------------------------------------------------------------

Installing Node Packages
"


addNodePackage () {
  cd ~
  echo " > Installing $1"
  npm install -g $1
  echo " > Installed $1"
  echo ""
}

for PACKAGE in $(cat ~/ArchTitus/pkg-files/node-pkgs.txt) do
  addNodePackage $PACKAGE
esac

echo -ne "
-------------------------------------------------------------------------
                    SYSTEM READY FOR 3-post-setup.sh
-------------------------------------------------------------------------
"
exit

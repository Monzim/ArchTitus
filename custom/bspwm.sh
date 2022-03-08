#!/usr/bin/env bash
source $HOME/ArchTitus/configs/setup.conf

bspwmConfig(){
    cd ~
    mkdir .config
    git clone -b test https://github.com/Monzim/dotfiles
    cd dotfiles
    stow bspwm
    stow sxhkd
    stow zsh
    stow kitty
    stow polybar
    stow zsh
    cd ~
}
echo -ne "
-------------------------------------------------------------------------
                    Installing BSPWM
                     Made By MONZIM
-------------------------------------------------------------------------
"

cd ~
sed -n '/'$INSTALL_TYPE'/q;p' ~/ArchTitus/custom/pkg/pacman-pkgs.txt | while read line
do
  echo "INSTALLING: ${line}"
  sudo pacman -S --noconfirm --needed ${line}
done


echo -ne "
-------------------------------------------------------------------------
Installing AUR Softwares
-------------------------------------------------------------------------
"
addAUR () {
  cd ~
  git clone "https://aur.archlinux.org/$1.git"
  cd ~/$1
  makepkg -si --noconfirm
  cd ~
}

if [${AURHELPER} -ne ""] then
  addAUR ${AURHELPER}
fi

for PACKAGE in $(cat ~/ArchTitus/custom/pkg/aur-pkgs.txt) do
  addAUR $PACKAGE
esac

echo -ne "
-------------------------------------------------------------------------
Configuring BSPWM
-------------------------------------------------------------------------
"
bspwmConfig
systemctl enable lightdm.service
exit
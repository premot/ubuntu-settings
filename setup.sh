#!/bin/sh

dconf load / < my.dconf

gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo systemctl enable --now ssh

#exit 0 

cd ~/
rm Documents/ Music/ Pictures/ Templates/ Videos/ -rf

sudo tee /etc/gdm3/custom.conf >/dev/null <<EOF2
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=$USER
EOF2


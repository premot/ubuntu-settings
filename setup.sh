#!/bin/sh

dconf load / < gsettings2.txt

exit 0

while read -r schema key value; do
  gsettings set "$schema" "$key" "$value"
done < gsettings.txt

exit 0

gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing'
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-battery-type 'nothing'

sudo tee /etc/gdm3/custom.conf >/dev/null <<EOF2
[daemon]
AutomaticLoginEnable=True
AutomaticLogin=$USER
EOF2
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo systemctl enable --now ssh

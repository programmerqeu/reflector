#!/bin/bash

# reflector
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# ---- System ---------------------------------------
apt-get update
apt-get upgrade


# ---- Dependencies ---------------------------------------

# Install Xserver, LXDE-gui and lightdm
apt-get install xinit xserver-xorg x11-xserver-utils
apt-get install lxde-core
apt-get install lightdm
apt-get install git
apt-get install libxss1 libnss3

# Autohiding the Mouse Cursor with unclutter:
apt-get install unclutter

# Node dependencies
npm install -g pm2


# ---- Configuration ---------------------------------------

echo "\n# Disable power saving\noptions 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1" >> /etc/modprobe.d/8192cu.conf

# Rotating the screen and hide Rainbow colored cube:
echo"\ndisplay_rotate=3\navoid_warnings=1\n" >> /boot/config.txt

# Disable screen saver
mkdir -p sudo nano /etc/xdg/lxsession/LXDE/
echo "\n@xset s noblank\n@xset s off\n@xset -dpms" >>  /etc/xdg/lxsession/LXDE/autostart
echo "xserver-command=X -s 0 -dpms" >> /etc/lightdm/lightdm.conf


# ---- MagicMirror ---------------------------------------

# Get and install MagicMirror with the Automatic Installer:
curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh | bash cd ~/MagicMirror

# Duplicate config/config.js.sample to config/config.js.
cp ~/MagicMirror/config/config.js.sample ~/MagicMirror/config/config.js

# Install the app:
cd ~/MagicMirror && npm install

echo "DISPLAY=:0 npm start" > ~/MagicMirror/mm.sh
chmod +x ~/MagicMirror/mm.sh


# ---- Start ---------------------------------------
# Auto Starting MagicMirror:
pm2 start ~/MagicMirro/mm.sh
pm2 save

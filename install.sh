# piball
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

FROM resin/%%RESIN_MACHINE_NAME%%-node
LABEL maintainer "André Lademann <vergissberlin@googlemail.com>"


# ---- System ---------------------------------------
apt-get update
apt-get upgrade

# Install Xserver, LXDE-gui and lightdm
apt-get install xinit xserver-xorg x11-xserver-utils
apt-get install lxde-core
apt-get install lightdm

# Let the LXDE-gui autostart:
apt-get install git

# ---- Dependencies ---------------------------------------

apt-get install libxss1 libnss3

# Autohiding the Mouse Cursor with unclutter:
apt-get install unclutter

# ---- Configuration ---------------------------------------

echo ""
echo "\n# Disable power saving\noptions 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1" >> /etc/modprobe.d/8192cu.conf

# Rotating the screen and hide Rainbow colored cube:
RUN echo"\ndisplay_rotate=3\navoid_warnings=1\n" /boot/config.txt


# ---- MagicMirror ---------------------------------------

# Get and install MagicMirror with the Automatic Installer:
curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh | bash cd ~/MagicMirror

# Install the app:
cd ~/MagicMirror && npm install

# Duplicate config/config.js.sample to config/config.js.
cp ~/MagicMirror/config/config.js.sample ~/MagicMirror/config/config.js


# ---- Start ---------------------------------------
# Auto Starting MagicMirror:
npm install -g pm2

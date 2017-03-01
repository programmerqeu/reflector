#!/bin/bash

# reflector
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT
# @link       https://netresearch.atlassian.net/wiki/display/IT/Smart+mirror


# ---- System ---------------------------------------

apt-get update
apt-get upgrade

# ---- Dependencies ---------------------------------------

apt-get install \
  apt-utils \
  curl \
  debconf-utils \
  festival \
  festival-doc \
  festival-freebsoft-utils \
  firmware-ralink \
  git-core \
  lxde-core \
  libnss3 \
  libsox-fmt-all \
  libxss1 \
  lightdm \
  mc \
  nodered \
  perl \
  python-rpi.gpio \
  sox \
  unclutter \
  vim \
  wget \
  wireless-tools \
  x11-xserver-utils \
  xinit \
  xserver-xorg


# Node dependencies
npm install -g \
  pm2 \
  pm2-gui \
  firebase

# ---- Configuration ---------------------------------------

echo "\n# Disable power saving\noptions 8192cu rtw_power_mgnt=0 rtw_enusbss=1 rtw_ips_mode=1" >> /etc/modprobe.d/8192cu.conf

# Rotating the screen and hide Rainbow colored cube:
echo"\ndisplay_rotate=3\navoid_warnings=1\n" >> /boot/config.txt

# Disable screen saver
sudo mkdir -p /etc/xdg/lxsession/LXDE/
sudo echo "\n@xset s noblank\n@xset s off\n@xset -dpms" >> /etc/xdg/lxsession/LXDE/autostart
sudo echo "xserver-command=X -s 0 -dpms" >> /etc/lightdm/lightdm.conf

# vim configuration
echo "syntax on" > ~/.vimrc

# Enviroment variables
echo '\
  export INITSYSTEM="on"\n\
  export JOBS="MAX"\n\
  export NODE_ENV="production"\n\
  export SYSTEM_TIMEZONE="Europe/Berlin"\n\
  export TERM=xterm\n' >> .bashrc

# Add github to the list of known_hosts
if [[ ! -d /root/.ssh ]]; then
  echo "Add github.com to known_hosts"
  mkdir /root/.ssh && touch /root/.ssh/known_hosts && ssh-keyscan -H github.com >> /root/.ssh/known_hosts && chmod 600 /root/.ssh/known_hosts
fi

# ---- CronJobs ---------------------------------------

# Install cron jobs
crontab boot/cronjobs.txt

# ---- MagicMirror ------------------------------------

# Get and install MagicMirror with the Automatic Installer:
curl -sL https://raw.githubusercontent.com/MichMich/MagicMirror/master/installers/raspberry.sh | bash cd ~/MagicMirror

# Link the config file
ln -s ~/MagicMirror/config.js ~/reflectorMagicMirror/config/config.js

# Install the app:
cd ~/MagicMirror && npm install

echo "DISPLAY=:0 npm start" >> ~/MagicMirror/reflector.sh
chmod +x ~/MagicMirror/reflector.sh


# ---- MagicMirror Modules ------------------------
# @link https://github.com/MichMich/MagicMirror/wiki/MagicMirror%C2%B2-Modules
repositories:=$(getColumn 1 '${ROOT}/modules.csv')

cd ~/MagicMirror/modules/
for value in ${repositories[@]}; do
    git clone $value
done

# ---- Start ---------------------------------------
pm2 start ~/MagicMirror/reflector.sh
pm2 save

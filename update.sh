#!/bin/bash

# reflector
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT
# @link       https://netresearch.atlassian.net/wiki/display/IT/Smart+mirror


# Constans
ROOT:='~/reflector'

# Include library
. ~/reflector/lib/csv.sh

# ---- System ------------------------------------


# ---- Reflector ---------------------------------
cd ${ROOT}
git pull

# ---- Node --------------------------------------
sudo npm install -g \
  pm2 \
  pm2-gui \
  firebase


# ---- MagicMirror --------------------------------
cd ~/MagicMirror/
git pull


# ---- MagicMirror Modules ------------------------
# @link https://github.com/MichMich/MagicMirror/wiki/MagicMirror%C2%B2-Modules
modules:=$(getColumn 0 '${ROOT}/modules.csv')

cd ~/MagicMirror/modules/
for value in ${modules[@]}; do
    cd $value && git pull
done

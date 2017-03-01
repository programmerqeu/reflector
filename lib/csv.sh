#!/bin/bash

# reflector
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# All n
function getColumn() {
  declare -a arr
  while read -r line; do
      arr=(${line//,/ })
      echo ${arr[$1]}
  done < $2
}

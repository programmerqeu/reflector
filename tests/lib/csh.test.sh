#!/bin/bash

# reflector
#
# LICENSE:    MIT
#
# @project    reflector
# @author     André Lademann <vergissberlin@googlemail.com>
# @license    http://opensource.org/licenses/MIT

# Includes
. ./lib/csv.sh

echo -e "\n::Get first column";
getColumn 0 './tests/fixtures/data.csv';

echo -e "\n::Get second column";
getColumn 1 './tests/fixtures/data.csv';

echo -e "\n::Iterate throug array";
data=$(getColumn 0 './tests/fixtures/data.csv')
for value in ${data[@]}; do
    echo -e "The culumn value is:\t$value"
done

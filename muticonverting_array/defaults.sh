#!/bin/bash

export nodes=${nodes:-"vcap@10.10.103.250 vcap@10.10.103.162 vcap@10.10.103.223"}

roles=${roles:-"ai i i"}

declare -p roles 2> /dev/null | grep -q '^declare \-a' && export roles=(${roles[*]}) || export roles=($roles)

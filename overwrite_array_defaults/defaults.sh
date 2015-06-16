#!/bin/bash

export nodes=${nodes:-"vcap@10.10.103.250 vcap@10.10.103.162 vcap@10.10.103.223"}
export default_roles=("ai" "i" "i")
if [[ -z "$roles" ]]; then
  export roles=("ai" "i" "i")
fi

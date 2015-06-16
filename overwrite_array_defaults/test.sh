#!/bin/bash

# source script.sh
source script.sh

if [[ "$MINION_IPS" == "10.10.103.250,10.10.103.162,10.10.103.223" ]]; then
  echo "."
else
  echo "test failed"
fi 


export nodes="user@1.1.1.1 user@2.2.2.2 user@3.3.3.3 user@4.4.4.4"
export roles=("ai" "i" "i" "i")

source script.sh

if [[ "$MINION_IPS" == "1.1.1.1,2.2.2.2,3.3.3.3,4.4.4.4" ]]; then
  echo "."
else
  echo "test failed"
fi 

#!/bin/bash

# source script.sh
export roles="ai i i i"
source defaults.sh

if [[ "${roles}" == "ai" ]]; then
  printf "."
else
  printf "test failed"
fi 

source defaults.sh
source defaults.sh

if [[ "${roles}" == "ai" ]]; then
  printf "."
else
  printf "test failed"
fi 

if [[ "${roles[1]}" == "i" ]]; then
  printf "."
else
  printf "test failed"
fi 

source script.sh
setClusterInfo

export roles=(ai i i i)
source defaults.sh

if [[ "${roles}" == "ai" ]]; then
  printf "."
else
  printf "test failed"
fi 

if [[ "${roles[2]}" == "i" ]]; then
  printf "."
else
  printf "test failed"
fi 

printf "\n"

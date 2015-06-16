#!/bin/bash

# Make an array out of a string, because having an array as a env variable is bad
roles=($roles)

if [[ "${roles[*]}" != "0 1 2 3 4" ]]; then
  echo "overall value of roles is wrong - ${roles[*]}"
  exit 1
fi

for ii in 0 1 2 3 4 ; do
  if [[ "${roles[${ii}]}" != "${ii}" ]]; then
    echo "script failed at index ${ii}"
    exit 1
  fi
done

echo "."

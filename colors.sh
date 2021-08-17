#!/bin/bash

echo
for FG in {30..37}; do
  for EM in 0 1 2 3 4 7 8 9; do
    echo -en "\033[$EM;${FG}m  [$EM;${FG}m  \033[0m";
  done
  echo;
done
echo

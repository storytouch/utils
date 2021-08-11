#!/bin/bash

set -e

for dir in * ; do
  if [[ -d $dir  ]] &&  [[ -d $dir/.git ]]; then
    (
      echo $dir

      # enters in the plugin's directory
      cd $dir

      # instal node packages
      npm install
    );
  fi
done

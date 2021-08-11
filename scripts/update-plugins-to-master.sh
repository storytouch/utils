#!/bin/bash

set -e

for dir in * ; do
  if [[ -d $dir  ]] &&  [[ -d $dir/.git ]]; then
    (
      echo ""
      echo $dir

      # enters in the plugin's directory
      cd $dir

      # fetch changes in all branches
      git fetch --all --prune

      # some plugins do not use master as default branch,
      # so make sure to checkout the right branch
      if [[ $dir == "ep_comments_page" ]]; then
        git checkout master-tk
      elif [[ $dir == "ep_googleanalytics" ]]; then
        git checkout upgrade_to_universal_analytics2
      else
        git checkout master
      fi

      # pull changes from remote branch
      git pull

      echo ""
    );
  fi
done

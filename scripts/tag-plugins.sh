#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# check if the TAG variable is set
length=${#TAG}
if [[ $length == 0 ]]; then
  # if not, display an error message
  printf "${RED}ERROR:${NC} Variable TAG is not set. Use the following command to set the right value:"
  # show how to set the variable
  echo "export TAG=the_right_tag"
  # show a link to the wiki page
  echo "See: https://github.com/storytouch/web/wiki/%5BHow-To%5D-Create-tag-for-a-new-release"
  # exit the script
  exit 1
fi

# check if the TAG variable is correct
printf "The tag ${GREEN}$TAG${NC} will be created. Is that rigth? (y/n)\n"
read -n1 -s answer

if [[ $answer == 'y' ]]; then
  # if it is correct, create the tags
  echo "Starting creating tags..."
  for dir in * ; do
    if [[ -d $dir  ]] &&  [[ -d $dir/.git ]]; then
      (
      cd $dir &&
        # Delete any pre-existing tag with the same name.
        # Only use this if you're replacing an existing tag
        # git tag --delete $TAG || true &&
        # git push --delete origin $TAG || true &&
        git tag $TAG &&
        git push origin $TAG
      );
    fi
  done
  echo "All tags created!"
else
  # if not, does nothing
  echo "Since the TAG variable is not rigth, set it correctly with the command:"
  # show how to set the variable
  echo "export TAG=the_right_tag"
fi

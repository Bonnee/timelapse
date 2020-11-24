#!/bin/bash
while read file
do

  echo "$(date -d"$(basename -s .jpg "$file")" +%s) < $(date -dyesterday +%s)"

  if [ $(date -d"$(basename -s .jpg "$file")" +%s) -lt $(date -dyesterday +%s) ]; then
    git rm $file
  fi

done <<< $(git ls-tree -r --name-only HEAD imgs)

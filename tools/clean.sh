#!/bin/bash
while read file
  do

  if [ $(git log --follow --format=%at -- $file | tail -1) -lt $(date -dyesterday +%s) ]; then
    git rm $file
  fi
done <<< $(git ls-tree -r --name-only HEAD imgs)

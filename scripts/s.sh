#!/bin/sh

mkdir -p unsure/spams
mkdir -p wrong/spams

for i in `find spams -type f`; do
  echo read $i
  bogofilter -v -t -I $i
  res=$?
  if [ $res = 2 ]; then
    cp -av $i unsure/spams/
  elif [ $res = 1 ]; then
    cp -av $i wrong/spams/
  fi
done

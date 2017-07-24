#!/bin/sh

mkdir -p unsure/ham
mkdir -p wrong/ham

for i in `find ham -type f`; do
  echo read $i
  bogofilter -v -t -I $i
  res=$?
  if [ $res = 2 ]; then
    cp -av $i unsure/ham/
  elif [ $res = 0 ]; then
    cp -av $i wrong/ham/
  fi
done


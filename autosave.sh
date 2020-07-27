#!/bin/bash

git add .
git commit -am "$(date "+%F %H:%M:%S") $* "
git push origin master



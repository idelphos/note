#!/bin/bash
source /etc/profile
echo -------------
echo $PATH
echo ----------
PATH=$PATH:/usr/local/bin

echo $PATH
echo

git add .
git commit -am "auto save from mac pro"
git push origin master



#!/bin/bash
#set -e

if [ "$1" = "" ]; then
  echo Usage\: $0 \{force\[Y\|N\]\}  
  exit 1
fi
if [ "$1" = "y" ] || [ "$1" = "Y" ]; then
  if [ -d jenkins_home ]; then
    sudo rm -rf jenkins_home/*
    if [ "$?" != 0 ]; then
       echo rm \-rf jenkins_home\/\* failed
       exit 1
    fi
  fi
  sudo git clean -fdX jenkins_home/
  if [ "$?" != 9 ]; then
	  echo Unable to clean git repository jenkins_home\/
	  exit 1
  fi
fi

#!/bin/bash
#Scrip to install all necessary packages and dependencies necessary for compiling Android Open Source Project.
#Developed by : Joseph Varghese
#Currently works only for Ubuntu versions 15.04 and higher

echo "*************************AOSP ENVIRONMENNT SETUP*************************"
echo  -n "Enter sudo password for $USER"
read -s password

echo "Please select your operating system"
echo "1. Ubuntu"
echo "2. macOS"
echo "Press 0 to Exit"
read user_os

if [[ $user_os == 1 ]]; then
  echo "ubuntu"
  os_bit = `uname -m`
  lsb_release -r >> aosp_ubuntu_version
  chmod a+x aosp_ubuntu_version
  ubuntu_version = `awk 'BEGIN{FS = " "}NF>1{print $NF}' aosp_ubuntu_version`
  #delete file at end
  if [[ubuntu_version -ge 15.04]]; then
    echo $password | sudo -S apt-get update
    echo $password | sudo apt-get install openjdk-8-jdk
    echo $password | sudo apt-get install git-core
    echo $password | sudo apt-get install gnupg
    echo $password | sudo apt-get install flex
    echo $password | sudo apt-get install bison
    echo $password | sudo apt-get install gperf
    echo $password | sudo apt-get install build-essential
    echo $password | sudo apt-get install zip
    echo $password | sudo apt-get install curl
    echo $password | sudo apt-get install zlib1g-dev
    echo $password | sudo apt-get install gcc-multilib
    echo $password | sudo apt-get install g++-multilib
    echo $password | sudo apt-get install libc6-dev-i386
    echo $password | sudo apt-get install lib32ncurses5-dev
    echo $password | sudo apt-get install x11proto-core-dev
    echo $password | sudo apt-get install libx11-dev
    echo $password | sudo apt-get install lib32z-dev
    echo $password | sudo apt-get install ccache
    echo $password | sudo apt-get install libgl1-mesa-dev
    echo $password | sudo apt-get install libxml2-utils
    echo $password | sudo apt-get install xsltproc
    echo $password | sudo apt-get install unzip


    #Configuring USB Access

    wget -S -O - http://source.android.com/source/51-android.txt | sed "s/$USER/$USER/" | sudo tee >/dev/null /etc/udev/rules.d/51-android.rules; sudo udevadm control --reload-rules

  elif [[ ubuntu_version -lt 15.4 ]]; then
    echo "Ubuntu Version 15.04 or higher is required to run this script"
  fi



elif [[ $user_os == 2 ]]; then
  echo "Coming Soon To macOS"
fi

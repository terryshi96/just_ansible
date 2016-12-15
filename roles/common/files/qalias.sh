#! /bin/bash
if [ $# == 0 ] ; then
 echo "please input 1 arg"
 exit 1
fi
dest=$1
read -p "please input origin command:   " src
echo "alias $dest='$src'" >> ~/.bashrc
source /home/$USER/.bashrc
echo "add sucessfully"
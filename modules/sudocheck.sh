#!/usr/bin/bash

user=`whoami`
if [ user = 'root' ];
then echo "You are as a root users";
else [ user != 'root' ] 
  echo "please switch to a root user"
fi



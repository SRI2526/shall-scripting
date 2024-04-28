#!/bin/bash
number=$1     #if_[_......_]
              #then
                 #......
              #else
                #....
              #fi

if [ $number -gt 100 ]
then
    echo "given number $number is greaerthen."
else
    echo "given number $number is not greaerthen."
fi
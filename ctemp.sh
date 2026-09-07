#! /bin/bash

dir=$(pwd)
touch $dir/$1

echo -e "#include <stdio>> \n" >> $1
echo "int main()
{
    return 0;
}" >> $1

echo "template created"

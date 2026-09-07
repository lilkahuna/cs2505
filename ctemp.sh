#! /bin/bash

if [[ $# -ne 1 ]]; then
	echo "file name required"
	exit 1
fi

dir=$(pwd)
file="$dir/$1"

touch "$file"

echo -e "#include <stdio> \n" >> $file
echo "int main()
{
    return 0;
}" >> $file

echo "template created"

#! /bin/bash

if [[ $# -lt 1 ]]; then
    echo "file name required"
    exit 1
fi

dir=$(pwd)
file="$dir/$1"

if [[ $# -gt 1 && "$1" == "-o" ]]; then
    file="$dir/$2"
    trap "vim $file" EXIT
fi

touch "$file"

echo -e "#include <stdio.h>\n" >> $file
echo "int main()
{
    return 0;
}" >> $file

echo "template created"

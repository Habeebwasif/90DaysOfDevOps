#!bin/bash

set -u #treats undefined variables as errors.

greet() {
	echo "Hello, $1!"
}

add(){
	c=$(($1 + $2))
	echo "$c"
}

read -p "Enter your name: " name
greet $name

read -p "Enter two numbers : " a b
if [ $a -eq $a ] &>/dev/null && [ $b -eq $b ] &>/dev/null;
then
        add $a $b
else
        echo "Enter valid integers"
        exit 1
fi

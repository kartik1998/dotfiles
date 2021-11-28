#!/bin/bash  

javac $1
IFS='.' 
read -ra str_array <<<"$1"

java $str_array
rm "$str_array.class"

#!/bin/bash 
if [ $# -ne 1 ]; then
	echo "the number of parameters is wrong" >&2
	exit 1
fi 
file=$1
while read line; do
	base=$(echo $line | cut -d ',' -f2)
	var="$(echo -e "${base}" | tr -d '[:space:]')"
	if ! [ -f $var ]; then
		touch $var
		./P.sh $var
		echo $var ",1" >> "$var"
		echo $var > map_pipe
		./V.sh $var
	else
		./P.sh $var
                echo $var ",1" >> "$var"
                echo $var > map_pipe
                ./V.sh $var
	fi
done <$file
echo "map finished" > map_pipe


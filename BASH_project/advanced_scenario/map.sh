#!/bin/bash 
if [ $# -ne 1 ]; then
	echo "the number of parameters is wrong" >&2
	exit 1
fi 
file=$1
while read line; do
	base=$(echo $line | cut -d ',' -f7)
	var="$(echo -e "${base}" | tr -d '[:space:]')"
	if [ ! -f $var ]; then
		touch $var
		./P.sh $var
		echo $var ",1" >> "$var"
		echo $var > map_pipe
		./V.sh $var
	elif [ "$var" != "" ];then
		./P.sh $var
                echo $var ",1" >> "$var"
                echo $var > map_pipe
                ./V.sh $var
	else
		touch Null
                ./P.sh Null
                echo "Null ,1" >> Null
		echo "Null" > map_pipe
                ./V.sh Null
	fi
done <$file
./P.sh map_pipe
echo "map finished" > map_pipe
./V.sh map_pipe

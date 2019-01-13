#!/bin/bash
echo "Starting $number_of_files map functions"
if [ ! -p map_pipe ]; then
	mkfifo map_pipe
fi
if [ ! -p reduce_pipe ];then
	mkfifo reduce_pipe
fi

for file in ~/BASH_project/Single_Node_MapReduce/files_to_map/*
do
	./map.sh $file &
done

map_finished=0
touch keys
while [ "$map_finished" -lt "$number_of_files" ]; do
	read input < map_pipe
	if [ "$input" = "map finished" ]; then
		((map_finished++))
		continue
	fi
	grep -q $input keys || echo $input >> keys;
done 

number_of_keys=$(cat keys | wc -l)
echo "Starting $number_of_keys reduce functions."
files_to_reduce=$(cat keys)

for file in $files_to_reduce
do
        ./reduce.sh $file &
done

reduce_finished=0
while [ $reduce_finished -lt $number_of_keys ]; do
        read input < reduce_pipe
        echo $input
        ((reduce_finished++)) 
done  

mkdir data_folder
for file in $files_to_reduce
do
  	mv $file data_folder
done
rm -r data_folder
rm keys map_pipe reduce_pipe

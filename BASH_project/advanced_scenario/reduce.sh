#!/bin/bash
if [ $# -ne 1 ]; then
        echo "the number of parameters is wrong" >&2
        exit 1
fi
count=$(cat $1 | wc -l)
var=$(head -1 $1 | cut -d " " -f1)
./P.sh reduce_pipe
echo $var $count > reduce_pipe
./V.sh reduce_pipe

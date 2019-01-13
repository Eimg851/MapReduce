#!/bin/bash
./echo.sh |nc -l 2020 | ./read.sh
mkfifo send_to_job
mkfifo read_from_job



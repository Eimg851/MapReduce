#!/bin/bash
while true; do
nc -l 2020 > send_to_job & read message < read_from_job
echo $message
./job_master.sh
done


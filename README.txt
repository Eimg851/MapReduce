This folder contains 4 different variations of the project. 
The Single_Node_MapReduce, simply run the ./job_master.sh to return the product values.(After each running of the job_master all files and folder associated with the mapReduce are removed. This includes, each Product file created, the keys file, the map_pipe and the reduce_pipe)
The advanced_scenario folder, runs 5 map functions on the 5 files. Simply change the field you wish to count in map.sh and execute as normal using ./job_master.sh
The advanced_scenario_analysis is where the single map reduce function file is stored. Again, run the ./job_master.sh as normal to see how it runs on the single csv file.
The Distributed_MapReduce contains efforts to complete the final section of the project. 

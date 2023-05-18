#!/bin/bash

# List the scenario files in the desired execution order
scenario_files=("6node-interest-500" "6node-interest-600")

# Loop through the scenario files and execute ndnSIM with each file
for file in "${scenario_files[@]}"
do
    # Execute ndnSIM with the current scenario file
    ./waf --run=$file

    # Add additional commands or processing as needed
done
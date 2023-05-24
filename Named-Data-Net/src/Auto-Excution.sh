#!/bin/bash

# List the scenario files in the desired execution order
scenario_files=(
    "6node-interest-100" 
    "6node-interest-200" 
    "6node-interest-300" 
    "6node-interest-400" 
    "6node-interest-500" 
    "6node-interest-600" 
    "6node-interest-700" 
    "6node-interest-800" 
    "6node-interest-900" 
    "9node-interest-100" 
    "9node-interest-200" 
    "9node-interest-300" 
    "9node-interest-400" 
    "9node-interest-500" 
    "9node-interest-600" 
    "9node-interest-700" 
    "9node-interest-800" 
    "9node-interest-900" 
    "9node-interest-1000" 
    "9node-interest-1100")

# Loop through the scenario files and execute ndnSIM with each file
for file in "${scenario_files[@]}"
do
    # Execute ndnSIM with the current scenario file
    ./waf --run=$file

    # Add additional commands or processing as needed
done
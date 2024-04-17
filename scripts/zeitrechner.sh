#!/bin/bash

# Function to convert time HHMM to minutes
convert_to_minutes() {
    local h=${1:0:2}
    local m=${1:2:2}
    echo $((10#$h * 60 + 10#$m))  # Using base 10 explicitly to avoid octal interpretation
}

# Function to convert minutes to HH:MM format
convert_to_time() {
    printf "%02d:%02d" $(( $1 / 60 )) $(( $1 % 60 ))
}

# Function to pad HHMM format with leading zeros
pad_time() {
    printf "%04d" $1
}

# Ask for start time
read -p "Enter start time (HHMM): " start_time
start_time=$(pad_time $start_time)

# Ask for end time
read -p "Enter end time (HHMM): " end_time
end_time=$(pad_time $end_time)

# Convert times to minutes
start_minutes=$(convert_to_minutes $start_time)
end_minutes=$(convert_to_minutes $end_time)

# Calculate the difference in minutes
difference=$((end_minutes - start_minutes))

# Convert the difference back to HH:MM format
time_diff=$(convert_to_time $difference)

echo "Time difference between $start_time and $end_time is $time_diff hours and minutes."

#!/bin/bash

# Define the CSV file where data will be stored
TIME_FILE="time_tracker.csv"

# Function to start a new task
function start_task {
  # Store the current date and time
  START_TIME=$(date +%s)
  
  # Get user input for task name and category
  read -p "Enter task name: " TASK_NAME
  read -p "Enter task category: " TASK_CATEGORY
  
  # Write the task name, category, and start time to the CSV file
  echo "$TASK_NAME,$TASK_CATEGORY,$START_TIME" >> $TIME_FILE
  
  echo "Started task: $TASK_NAME ($TASK_CATEGORY)"
}

# Function to stop the current task
function stop_task {
  # Get the last line in the CSV file
  LAST_LINE=$(tail -n 1 $TIME_FILE)
  
  # Get the task name, category, and start time from the last line
  IFS=',' read -r TASK_NAME TASK_CATEGORY START_TIME <<< "$LAST_LINE"
  
  # Calculate the elapsed time
  END_TIME=$(date +%s)
  ELAPSED_TIME=$((END_TIME - START_TIME))
  
  # Append the end time and elapsed time to the last line in the CSV file
  sed -i "$ s/$/, $END_TIME, $ELAPSED_TIME/" $TIME_FILE
  
  echo "Stopped task: $TASK_NAME ($TASK_CATEGORY) - elapsed time: $ELAPSED_TIME seconds"
}

# Function to generate a report of all tasks
function generate_report {
  echo "Task Name,Category,Start Time,End Time,Elapsed Time (seconds)"
  echo "------------------------------------------------------------"
  
  # Loop through each line in the CSV file
  while IFS=',' read -r TASK_NAME TASK_CATEGORY START_TIME END_TIME ELAPSED_TIME; do
    # Convert start time and end time to human-readable format
    START_TIME_STR=$(date -d @$START_TIME +"%Y-%m-%d %H:%M:%S")
    END_TIME_STR=$(date -d @$END_TIME +"%Y-%m-%d %H:%M:%S")
    
    # Print the task name, category, start time, end time, and elapsed time
    echo "$TASK_NAME,$TASK_CATEGORY,$START_TIME_STR,$END_TIME_STR,$ELAPSED_TIME"
  done < $TIME_FILE
}

# Display a menu with options for the user
while true; do
  echo "1. Start task"
  echo "2. Stop task"
  echo "3. Generate report"
  echo "4. Exit"
  
  read -p "Enter your choice: " CHOICE
  
  case $CHOICE in
    1) start_task;;
    2) stop_task;;
    3) generate_report;;
    4) exit;;
    *) echo "Invalid choice.";;
  esac
done


#!/bin/bash

# Set the default Git branch name
DEFAULT_BRANCH="main"

# Define the Git commands to be executed
GIT_CMD_CREATE_BRANCH="git branch"
GIT_CMD_SWITCH_BRANCH="git checkout"
GIT_CMD_COMMIT="git commit -m"
GIT_CMD_MERGE="git merge"
GIT_CMD_STATUS="git status"
GIT_CMD_LOG="git log"
GIT_CMD_DIFF="git diff"
GIT_CMD_PUSH="git push"
GIT_CMD_PULL="git pull"
GIT_CMD_CLONE="git clone"
GIT_CMD_INIT="git init"

# Define the function to create a new branch
function create_branch {
    branch_name="$1"
    $GIT_CMD_CREATE_BRANCH "$branch_name"
}

# Define the function to switch to an existing branch
function switch_branch {
    branch_name="$1"
    $GIT_CMD_SWITCH_BRANCH "$branch_name"
}

# Define the function to commit changes
function commit_changes {
    commit_message="$1"
    $GIT_CMD_COMMIT "$commit_message"
}

# Define the function to merge branches
function merge_branches {
    source_branch="$1"
    target_branch="$2"
    $GIT_CMD_MERGE "$source_branch" "$target_branch"
}

# Define the function to display the Git status
function display_status {
    $GIT_CMD_STATUS
}

# Define the function to display the Git log
function display_log {
    $GIT_CMD_LOG
}

# Define the function to display the Git diff
function display_diff {
    $GIT_CMD_DIFF
}

# Define the function to push changes to a remote repository
function push_changes {
    remote_name="$1"
    branch_name="$2"
    $GIT_CMD_PUSH "$remote_name" "$branch_name"
}

# Define the function to pull changes from a remote repository
function pull_changes {
    remote_name="$1"
    branch_name="$2"
    $GIT_CMD_PULL "$remote_name" "$branch_name"
}

# Define the function to clone a remote repository
function clone_repository {
    repository_url="$1"
    directory_name="$2"
    $GIT_CMD_CLONE "$repository_url" "$directory_name"
}

# Define the function to initialize a new Git repository
function initialize_repository {
    $GIT_CMD_INIT
    create_branch "$DEFAULT_BRANCH"
}

# Initialize the Git repository
initialize_repository

# Display a menu of available options
echo "Git Automation Menu:"
echo "1. Create a new branch"
echo "2. Switch to an existing branch"
echo "3. Commit changes"
echo "4. Merge branches"
echo "5. Display Git status"
echo "6. Display Git log"
echo "7. Display Git diff"
echo "8. Push changes to a remote repository"
echo "9. Pull changes from a remote repository"
echo "10. Clone a remote repository"
echo "0. Exit"

# Prompt the user to enter a menu option
read -p "Enter option number: " option

# Process the user's menu option
case "$option" in
    1)
        read -p "Enter the name of the new branch: " branch_name
        create_branch "$branch_name"
        ;;
    2)
        read -p "Enter the name of the existing branch: " branch_name
        switch_branch "$branch_name"
        ;;
    3)
        read -p "Enter the commit message: " commit_message
        commit_changes "$commit_message"
        ;;
    4)
        read -p "Enter the name of the source branch: " source_branch
        read -p "Enter the name of the target branch: " target_branch
        merge_branches "$source_branch" "$target_branch"
        ;;
    5)
        display_status
        ;;
    6)
        display_log
        ;;
    7)
        display_diff
        ;;
    8)
        read -p "Enter the name of the remote repository: " remote_name
        read -p "Enter the name of the branch to push: " branch_name
        push_changes "$remote_name" "$branch_name"
        ;;
    9)
        read -p "Enter the name of the remote repository: " remote_name
        read -p "Enter the name of the branch to pull: " branch_name
        pull_changes "$remote_name" "$branch_name"
        ;;
    10)
        read -p "Enter the URL of the remote repository: " repository_url
        read -p "Enter the name of the directory to clone to: " directory_name
        clone_repository "$repository_url" "$directory_name"
        ;;
    0)
        echo "Exiting Git Automation"
        exit 0
        ;;
    *)
        echo "Invalid option selected"
        exit 1
        ;;
esac


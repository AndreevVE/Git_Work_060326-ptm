#!/bin/bash

if [ -d ".git" ]
then
    echo "Git repository found. Committing changes..."
    git add .
    git commit -m "Auto commit: Malcov Vitalii $(date +"%Y-%m-%d %H:%M:%S")"
    echo "Changes committed successfully."
else
    echo "No Git repository found. Please initialize a Git repository first."
fi

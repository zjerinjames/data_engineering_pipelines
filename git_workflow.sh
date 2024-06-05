# Git Workflow for Pushing Changes to GitHub

# Set up remote origin
git remote add origin <repository_url>

# Ensure current branch is named 'main'
git branch -M main

# Push changes to GitHub
git push -u origin main

# Check current status
git status

# Remove staging for 'Kafka and Zookeeper Setup Workflow.yaml'
git restore --staged Kafka\ and\ Zookeeper\ Setup\ Workflow.yaml

# Check status after unstaging
git status

# Add changes for commit
git add .

# Commit changes with message "kafka basics"
git commit -m "kafka basics"


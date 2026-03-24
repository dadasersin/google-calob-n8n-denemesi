#!/bin/bash

# Configuration
REPO_URL="https://${GITHUB_TOKEN}@github.com/dadasersin/google-calob-n8n-denemesi.git"
BACKUP_DIR="/home/node/.n8n/backups"

# Navigate to n8n data directory
cd /home/node/.n8n

# Export workflows
n8n export:workflow --all --output=backups/workflows.json
# Export credentials (optional, and insecure if not properly handled)
# n8n export:credentials --all --output=backups/credentials.json

# Git setup
git config --global user.email "backup@n8n-render.com"
git config --global user.name "n8n Backup Bot"

# Clone if not already present or just init and pull
if [ ! -d ".git" ]; then
  git init
  git remote add origin "$REPO_URL"
fi

git add backups/
git commit -m "Auto-backup: $(date)"
git push origin main

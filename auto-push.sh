#!/bin/bash
echo "Starting auto-push for /home/ryan/discord"

# Monitor for changes, excluding .git folder and .env file
chokidar /home/ryan/discord -i 'node_modules/**' -i '.git/**' -i '.env' -c '
    cd /home/ryan/discord &&
    if [ -n "$(git status --porcelain)" ]; then
        echo "Changes detected. Committing and pushing..."
        git add . &&
        git reset .env && # Unstage .env if it gets staged accidentally
        git commit -m "Auto-commit: $(date)" &&
        git push
    else
        echo "No changes to commit. Skipping push."
    fi
'

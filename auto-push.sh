#!/bin/bash
echo "Starting auto-push for /home/ryan/discord"

# Monitor changes, excluding unnecessary files and directories
chokidar /home/ryan/discord -i 'node_modules/**' -i '.git/**' -i '.env' -c '
    cd /home/ryan/discord &&
    if [ -n "$(git status --porcelain)" ]; then
        echo "Changes detected. Committing and pushing..."
        git add . &&
        git reset .env && # Ensure .env is never committed
        git commit -m "Auto-commit: $(date)" &&
        git push
    else
        # Suppress repetitive "No changes" output
        sleep 1
    fi
'

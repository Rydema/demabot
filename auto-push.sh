#!/bin/bash
echo "Starting auto-push for /home/ryan/discord"

# Monitor for changes
chokidar /home/ryan/discord -i 'node_modules/**' -c '
    cd /home/ryan/discord &&
    if [ -n "$(git status --porcelain)" ]; then
        echo "Changes detected. Committing and pushing..."
        git add . &&
        git commit -m "Auto-commit: $(date)" &&
        git push
    else
        echo "No changes to commit. Skipping push."
    fi
'

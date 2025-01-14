#!/bin/bash
echo "Starting auto-push for /home/ryan/discord"
chokidar /home/ryan/discord -i 'node_modules/**' -c 'cd /home/ryan/discord && git add . && git commit -m "Auto-commit: $(date)" && git push'

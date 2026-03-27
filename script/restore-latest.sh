#!/bin/bash
# Restore script to deploy the latest commit

LATEST_COMMIT=$(tail -1 ~/warung-pintar-devops/script/version_history.txt)

if [ -z "$LATEST_COMMIT" ]; then
    echo "Error: No commit found in version history"
    exit 1
fi

echo "Restoring to latest commit: $LATEST_COMMIT"
docker stop warung-app 2>/dev/null || true
docker rm warung-app 2>/dev/null || true 
docker run -d \
    --name warung-app \
    --restart unless-stopped \
    -p 8080:5000 \
    warung-app:"$LATEST_COMMIT"

if [ $? -eq 0 ]; then
    echo "Restore successful"
else
    echo "Error: Restore failed"
    exit 1
fi



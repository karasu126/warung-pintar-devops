#!/bin/bash
# Rollback script to revert to the previous commit

PREVIOUS_COMMIT=$(tail -2 ~/version_history.txt | head -1)

if [ -z "$PREVIOUS_COMMIT" ]; then
    echo "Error: No previous commit found in version history"
    exit 1
fi

echo "Rolling back to commit: $PREVIOUS_COMMIT"
docker stop warung-app 2>/dev/null || true
docker rm warung-app 2>/dev/null || true

docker run -d \
    --name warung-app \
    --restart unless-stopped \
    -p 8080:5000 \
    warung-app:"$PREVIOUS_COMMIT"

if [ $? -eq 0 ]; then
    echo "Rollback successful"
else
    echo "Error: Rollback failed"
    exit 1
fi
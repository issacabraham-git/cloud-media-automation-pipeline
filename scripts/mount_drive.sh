#!/bin/bash
# Ensures the Cloud Drive is connected to the Linux filesystem
REMOTE_NAME="gd"
MOUNT_PATH="/home/opc/media_drive"
CONFIG_PATH="/home/opc/bot/rclone.conf"

if mountpoint -q "$MOUNT_PATH"; then
    echo "Drive already mounted."
else
    sudo rclone mount $REMOTE_NAME: $MOUNT_PATH \
        --config $CONFIG_PATH \
        --vfs-cache-mode full \
        --allow-other \
        --daemon
    echo "Mounting complete."
fi

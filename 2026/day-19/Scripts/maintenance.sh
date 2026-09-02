#!/bin/bash

LOG="/var/log/maintenance.log"

{
    echo "Maintenance Started: $(date)"

    echo "Running Log Rotation:"
    /home/ubuntu/devops-ai-powered/90daysofdevops/log_rotate.sh /var/log/demo

    echo "Running Backup:"
    /home/ubuntu/devops-ai-powered/90daysofdevops/backup.sh /home/ubuntu/backup-test/source /home/ubuntu/backup-test/backups

    echo "Maintenance Completed: $(date)"
    echo
} >> "$LOG" 2>&1

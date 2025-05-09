#!/bin/bash
lynis audit system > /lynis-result.txt

# Gửi thông báo qua Slack
# SLACK_WEBHOOK_URL="https://hooks.slack.com/services/xxx/yyy/zzz"
# SUMMARY=$(cat /lynis-result.txt | grep -E "\[WARNING\]|\[PASS\]" | head -n 10)
# curl -X POST -H 'Content-type: application/json' --data "{\"text\":\"Lynis Audit Report ($(date)):\n$SUMMARY\"}" $SLACK_WEBHOOK_URL

# Gửi email
echo "Lynis Audit Report ($(date))\nSee attached results." | mail -s "Lynis Audit Report" -A /lynis-result.txt tnvan2903@gmail.com

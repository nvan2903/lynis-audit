#!/bin/bash
lynis audit system > /lynis-result.txt

echo "Lynis Audit Report ($(date))\nSee attached results." | mail -s "Lynis Audit Report" -A /lynis-result.txt tnvan2903@gmail.com

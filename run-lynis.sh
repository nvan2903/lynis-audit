#!/bin/bash

# Create logs directory if it doesn't exist
mkdir -p /audit/logs

# Run Lynis audit and save output
lynis audit system > /audit/logs/lynis-result.txt

# Generate timestamp for the log file
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
cp /audit/logs/lynis-result.txt "/audit/logs/lynis-result-${TIMESTAMP}.txt"

# Print completion message
echo "Lynis audit completed. Results saved to /audit/logs/lynis-result.txt"

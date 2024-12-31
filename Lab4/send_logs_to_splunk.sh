#!/bin/bash -x

# Configuration
SPLUNK_HEC_URL="https://10.10.10.172:8088/services/collector" # Replace with your Splunk HEC URL/IP - My example is listed here.
SPLUNK_TOKEN="82fb82f2-5fda-4cf0-833a-d701d0fd2a39" # Replace with your HEC token. This is an example HTTP Event Collector (HEC)
LOG_FILE="/var/log/application.log" # Path to your log file
HOST="your-hostname" # Optional: Set the host value
SOURCE="custom-log" # Optional: Set the source value
SOURCETYPE="_json" # Optional: Set the sourcetype value

# Function to send logs to Splunk
send_to_splunk() {
  local log_data="$1"

  curl -k -s -o /dev/null -w "%{http_code}\n" \
    -H "Authorization: Splunk $SPLUNK_TOKEN" \
    -H "Content-Type: application/json" \
    -X POST "$SPLUNK_HEC_URL" \
    -d "{
      \"event\": $log_data,
      \"host\": \"$HOST\",
      \"source\": \"$SOURCE\",
      \"sourcetype\": \"$SOURCETYPE\"
    }"
}

# Read and send logs
if [ -f "$LOG_FILE" ]; then
  while IFS= read -r line; do
    # Escape the log line for JSON
    escaped_line=$(echo "$line" | sed 's/"/\\"/g')
    
    # Send log line to Splunk
    response_code=$(send_to_splunk "$escaped_line")

    if [ "$response_code" -ne 200 ]; then
      echo "Failed to send log line to Splunk: HTTP $response_code"
    fi
  done < "$LOG_FILE"
else
  echo "Log file not found: $LOG_FILE"
  exit 1
fi

exit 0

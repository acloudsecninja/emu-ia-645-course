#!/bin/bash -x

# Pull the latest version of Splunk Enterprise
docker pull splunk/splunk:9.4

# Deploy a newly created Docker container for Splunk with privileged port 514 enabled
# Default password is set to "password" with "admin" as the main user
# This is for testing and development environments only
# Accepts the "Free License for Splunk"
docker run --name splunkfree \
  --hostname splunkfree \
  -p 8000:8000 \
  -p 10000:10000/tcp \
  -p 8080:8080 \
  -p 514:514/tcp \
  -p 9997:9997 \
  --cap-add=NET_BIND_SERVICE \
  -e "SPLUNK_PASSWORD=password" \
  -e "SPLUNK_START_ARGS=--accept-license" \
  -e "SPLUNK_GENERAL_TERMS=--accept-sgt-current-at-splunk-com" \
  -e "SPLUNK_LICENSE_URI=Free" \
  -it splunk/splunk:9.4
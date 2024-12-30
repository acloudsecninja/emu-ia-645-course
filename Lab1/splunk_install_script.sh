#!/bin/bash -x

docker pull splunk/splunk:latest ## This will pull the latest version of Splunk Free 


## This will deploy a newly created docker container with spunk with a default password of password ##
## and admin as the main user and it will allow the container to come up. ##
## This is for testing and dev environments only.
docker run -d --name splunkfree --hostname splunkfree \
  -p 8000:8000 -p 8088:8088 -p 514:514/udp -p 514:514 -9997:9997 \
  -e SPLUNK_START_ARGS="--accept-license" \
  -e SPLUNK_PASSWORD="password" \
  -v ~/splunk-data:/opt/splunk/var \
  splunk/splunk:latest
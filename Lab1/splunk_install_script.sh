#!/bin/bash -x

docker pull splunk/splunk:latest ## This will pull the latest version of Splunk Enterprise


## This will deploy a newly created docker container with spunk with a default password of password ##
## and admin as the main user and it will allow the container to come up. ##
## This is for testing and dev environments only.
## This accepts the "Free License for Splunk"
docker run --name splunkfree --hostname splunkfree -p 8000:8000 -p 8080:8080 -p 514:514 -p 9997:9997  \
  -e "SPLUNK_PASSWORD=password" \
  -e "SPLUNK_START_ARGS=--accept-license" \
  -e "SPLUNK_LICENSE_URI=Free" \
  -it splunk/splunk:latest
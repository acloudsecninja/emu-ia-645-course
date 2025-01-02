#!/bin/bash -x

docker build -t openai-local .


docker run -d -p 8001:8001 openai-local

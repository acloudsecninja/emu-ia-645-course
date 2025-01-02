#!/bin/bash -x

docker build -t openai-local .


docker run -d -p 8000:8000 openai-local

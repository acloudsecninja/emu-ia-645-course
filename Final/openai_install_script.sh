#!/bin/bash -x

docker build -t openai-app .

docker run -d -p 8001:8001 --env-file .env openai-app



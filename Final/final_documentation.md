#  Final

- In this Final you will setup an openAI configuration API key https://platform.openai.com/login/ and use that key to connect this docker container to OPENAI API.

1. You will install a local install of Docker container with access to the OPENAI API which means you need to run the openai_install_script.sh

2. OPENAI is the company for ChatGPT https://chatgpt.com . In this case you must add the environment variable (which is your API KEY for access) which is mostly setup for you in the file structure in github and the final and you just must figure out how it all connects. 

- HINT: Look at the ENV you set in the openai_install_script.sh and it should make sense how it all works with the dockerfile and the script as that is critical to see! You may find other typos in the codebase too.

3. Once you are able to deploy the script and docker container. You should be able to run the following command to verify that the environment variable it setup correctly and it should be able to connect to OPENAI when you connect to the container itself which we will check later in the Final.

4. Connect to the docker container by logging into the exec prompt via docker desktop or running the command below.

```bash
docker exec -it <container_name_or_id> /bin/bash
```

5. You can check if your environment variable is setup correctly using this command.

```bash
docker exec -it <container_name> env | grep OPENAI_API_KEY
```

6. You should then be able to interact with the API as shown below which means you have set it up correctly.  This curl command below will ask OpenAI to tell you a joke and you should get a response! You will need to connect to the docker container and run the command below which should give you a response (You will need to figure out how to connect to the docker container and see this output.) 

- HINT: Look at the docker desktop application:

```bash
curl -X POST http://localhost:8001/chat \
-H "Content-Type: application/json" \
-d '{"prompt": "Tell me a joke.", "model": "text-davinci-003"}'
```


6. Once you have it working you should see the output in Docker Desktop and show a screenshot in your upload! Congrats you have completed this lab which can show you the power of OpenAI and data analytics in CyberSecurity! 

7. The purpose of this lab was to make something very complicated(docker,API,containers) seem easy and in general get you thinking that you could use this in future roles to use the power of AI to help in splunk data in cybersecurity. I wanted to expand on this with connecting to splunk itself ,but I think this is complicated enough. Let me know what you think!

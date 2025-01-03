#  Final

- In this Final you will setup an openAI configuration API key https://platform.openai.com/login/ and use that key to connect this docker container to OPENAI API. You will not fully get it working unless you want to as it costs money to do. In this Final lab we will set it up where it should work minus the credit part portion as its not required to gain full credit. 

1. You will install a local install of Docker container with access to the OPENAI API which means you need to run the openai_install_script.sh

2. OPENAI is the company for ChatGPT https://chatgpt.com . In this case you must add the environment variable (which is your API KEY for access) which is mostly setup for you in the file structure in github and the final and you just must figure out how it all connects. 

- HINT: Look at how to export the variable into the docker container when you generate it.

3. Once you are able to deploy the script and docker container. You should be able to run the following command to verify that the environment variable it setup correctly and it should be able to connect to OPENAI when you connect to the container itself which we will check later in the Final.

4. Connect to the docker container by logging into the exec prompt via docker desktop or running the command below.

```bash
docker exec -it <container_name_or_id> /bin/bash
```

5. You can check if your environment variable is setup correctly using this command.

```bash
docker exec -it <container_name> env | grep openai.api_key
```

6. You should then be able to interact with the API as shown below which means you have set it up correctly.  This curl command below will ask OpenAI to tell you a joke and you should get a response! You will need to connect to the docker container and run the command below which should give you a response (You will need to figure out how to connect to the docker container and see this output.) 

- HINT: Look at the docker desktop application:

```bash
curl -X POST http://localhost:8001/chat \
-H "Content-Type: application/json" \
-d '{"prompt": "Tell me a joke.", "model": "gpt-4o-mini"}'
```


6. Once you recieved the following error If you are able to get an error relating to {"error":"You exceeded your current quota, please check your plan and billing details. For more information on this error, read the docs: https://platform.openai.com/docs/guides/error-codes/api-errors."} then you have completed the Final besides the splunk connecting to splunk part. You have completed this lab which can show you the power of OpenAI and data analytics in CyberSecurity! and you can prove that with a screenshot then that will be enough to complete the final lab.

- NOTE: You can add credits (add a credit card) to actually test the platform but its not required in this course. You can do this by going to this URL and setting up and org and adding a credit card. --> https://platform.openai.com/settings/organization/billing/overview - You can see the final screenshots in the documentation in the Google document in the contexts of this folder in Google Drive.

7. The purpose of this lab was to make something very complicated(docker,API,containers,openai) seem easy and in general get you thinking that you could use this in future roles to use the power of AI to help in splunk data in cybersecurity. I wanted to expand on this with connecting to splunk itself ,but I think this is complicated enough. Let me know what you think!

- acloudsecninja - Professor Weber

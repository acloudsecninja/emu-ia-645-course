#  Final

1. You will install a local install of Docker container with access to the OPENAI API which means you need to run the openai_install_script.sh as step 1.

- which is in simple terms is actually https://chatgpt.com you must add the environment variable as your OpenAI API key (you will need to figure out this part).

2. Once you have completed this then you should be able to start run the install script setup_and_install_openai.py.


3. You should then be able to interact with the API as shown below which means you have set it up correctly.  This will ask OpenAI to tell you a joke and you should get a response! You will need to connect to the docker container and run the command below which should give you a response (You will need to figure out how to connect to the docker container):

```bash
curl -X POST http://localhost:8000/interact \
-H "Content-Type: application/json" \
-d '{"prompt": "Tell me a joke.", "model": "text-davinci-003"}'

```

### NEED TO FINISH BELOW HERE ####

4. Once you have completed this part then you will be able to connect to the splunk free instance to see if we can analyze the data.


5. Run the script to connect_to_local_splunk.py and once its successful then we need to start the docker image by running the command.


# Once script is installed then run the following script.

1. Run the script openai_install_script.sh which will install a local install of Docker and allow it to be running locally.

2. Once its running then we can use this openAI API to interact with it.

3. Validate the API by running the command below.

```bash
curl -X POST http://localhost:8000/interact \
-H "Content-Type: application/json" \
-d '{"prompt": "Hello, how are you?"}'
```

4. Once you have validate the OpenAPI is running locally then we can try and connect to our Splnk Free Instance

5. TBD



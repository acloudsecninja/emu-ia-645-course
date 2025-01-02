import os
import json
import setup_and_install_openai as setup_and_install_openai
import requests
from splunklib import client

# Configuration
SPLUNK_HOST = "localhost"
SPLUNK_PORT = 8089
SPLUNK_USERNAME = "admin"
SPLUNK_PASSWORD = "password"
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")  # Set your OpenAI API key as an environment variable

# Initialize OpenAI API
setup_and_install_openai.api_key = OPENAI_API_KEY

def query_splunk(search_query):
    """Query Splunk using Splunk SDK."""
    try:
        # Connect to Splunk
        service = client.connect(
            host=SPLUNK_HOST,
            port=SPLUNK_PORT,
            username=SPLUNK_USERNAME,
            password=SPLUNK_PASSWORD
        )

        # Run the search query
        search_kwargs = {"exec_mode": "normal"}
        job = service.jobs.create(search_query, **search_kwargs)

        # Wait for the job to complete
        while not job.is_done():
            pass

        # Retrieve results
        results = []
        for result in job.results():
            results.append(result)
        return results

    except Exception as e:
        print(f"Error querying Splunk: {e}")
        return []

def analyze_with_openai(prompt):
    """Send data to OpenAI for analysis."""
    try:
        response = setup_and_install_openai.Completion.create(
            engine="text-davinci-003",  # Replace with your desired OpenAI model
            prompt=prompt,
            max_tokens=150,
            temperature=0.7
        )
        return response.choices[0].text.strip()
    except Exception as e:
        print(f"Error analyzing data with OpenAI: {e}")
        return None

def main():
    # Example Splunk Search Query
    splunk_query = "search index=main sourcetype=fake_security | head 10"

    print("Querying Splunk...")
    splunk_results = query_splunk(splunk_query)

    if not splunk_results:
        print("No results found in Splunk.")
        return

    # Combine Splunk results into a single prompt for OpenAI
    prompt = "Analyze the following Splunk logs and provide insights:\n\n"
    for result in splunk_results:
        prompt += json.dumps(result) + "\n"

    print("Sending data to OpenAI...")
    openai_response = analyze_with_openai(prompt)

    if openai_response:
        print("\nOpenAI Analysis:\n")
        print(openai_response)
    else:
        print("No response from OpenAI.")

if __name__ == "__main__":
    main()

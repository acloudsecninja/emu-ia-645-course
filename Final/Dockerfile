# Use an official Python image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the app files
COPY app.py /app
COPY requirements.txt /app

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install nano for editing the openai file in the docker container.
RUN apt-get update && apt-get install -y nano curl

# Expose port 8001 for the API
EXPOSE 8001

# Pass the OpenAI API key as an environment variable. Do not use this method to input the ENV variable. 
# Run the local export command to add the API key to your local install.
## ENV OPENAI_API_KEY=<your-openai-api-key>

# Command to run the application
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8001"]

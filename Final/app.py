import os
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import openai

# Initialize FastAPI app
app = FastAPI()

# Load OpenAI API key from environment variable
openai.api_key = os.getenv("OPENAI_API_KEY")

# Define the request schema
class Query(BaseModel):
    prompt: str
    model: str = "text-davinci-003"  # Default model

@app.post("/interact")
async def interact(query: Query):
    try:
        # Call OpenAI API
        response = openai.Completion.create(
            engine=query.model,
            prompt=query.prompt,
            max_tokens=100,
            temperature=0.7
        )

        # Print response for debugging
        print("OpenAI API Response:", response)

        # Return the API response
        return {"prompt": query.prompt, "response": response.choices[0].text.strip()}
    except Exception as e:
        # Raise HTTP exception on errors
        raise HTTPException(status_code=500, detail=str(e))
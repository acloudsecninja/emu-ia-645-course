import os
from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import Final.setup_and_install_openai as setup_and_install_openai

# Initialize FastAPI app
app = FastAPI()

# Load OpenAI API key from environment variable
setup_and_install_openai.api_key = os.getenv("OPENAI_API_KEY")

class Query(BaseModel):
    prompt: str
    model: str = "text-davinci-003"  # Default model

@app.post("/interact")
async def interact(query: Query):
    try:
        # Call OpenAI API
        response = setup_and_install_openai.Completion.create(
            engine=query.model,
            prompt=query.prompt,
            max_tokens=100,
            temperature=0.7
        )
        return {"prompt": query.prompt, "response": response.choices[0].text.strip()}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

from fastapi import FastAPI, HTTPException
from pydantic import BaseModel

app = FastAPI()

class Query(BaseModel):
    prompt: str

@app.post("/interact")
async def interact(query: Query):
    # Mock response (replace this with actual model interaction code)
    response = {
        "prompt": query.prompt,
        "response": f"Mock response for: {query.prompt}"
    }
    return response

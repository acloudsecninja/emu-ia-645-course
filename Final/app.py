import openai
import os
from flask import Flask, request, jsonify

# Initialize Flask app
app = Flask(__name__)

# Set OpenAI API key
openai.api_key = os.getenv("OPENAI_API_KEY")

# Endpoint for ChatGPT interaction
@app.route("/chat", methods=["POST"])
def chat():
    data = request.json
    prompt = data.get("prompt", "")
    if not prompt:
        return jsonify({"error": "Prompt is required"}), 400

    try:
        response = openai.ChatCompletion.create(
            model="gpt-4",  # Change to "gpt-3.5-turbo" if needed
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": prompt},
            ],
            max_tokens=100,
            temperature=0.7,
        )
        return jsonify({"response": response['choices'][0]['message']['content'].strip()})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# Health check endpoint
@app.route("/health", methods=["GET"])
def health_check():
    return jsonify({"status": "running"}), 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8001)

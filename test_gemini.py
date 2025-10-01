import os
from google import genai

# Load API key from environment variable
client = genai.Client(api_key=os.environ["GOOGLE_API_KEY"])

# Use Gemini 2.0 Pro (change model name if needed)
response = client.models.generate_content(
    model="gemini-2.0-pro",
    contents="Hello Gemini from VS Code WSL!"
)

print("Response:", response.text)

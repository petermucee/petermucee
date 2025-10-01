import os
from flask import Flask, request, jsonify
import google.generativeai as genai
from dotenv import load_dotenv

load_dotenv()  # loads GOOGLE_API_KEY from .env

API_KEY = os.getenv("GOOGLE_API_KEY")
if not API_KEY:
    raise SystemExit("Set GOOGLE_API_KEY in .env first")

genai.configure(api_key=API_KEY)

app = Flask(__name__)

@app.route("/api/generate", methods=["POST"])
def generate():
    payload = request.get_json() or {}
    prompt = payload.get("prompt", "")
    if not prompt:
        return jsonify({"error":"missing prompt"}), 400

    model_name = payload.get("model", "models/gemini-2.5-pro")
    try:
        model = genai.GenerativeModel(model_name)
        resp = model.generate_content(prompt)
        return jsonify({"output": resp.text})
    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="127.0.0.1", port=8080)

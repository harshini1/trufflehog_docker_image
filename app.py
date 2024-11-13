from flask import Flask, request
import os
import subprocess

app = Flask(__name__)

@app.route("/")
def hello_world():
    repo = request.args.get('repo')
    a = subprocess.run(["trufflehog", "github", "--repo", repo, "--debug"], capture_output=True)
    return a.stdout.decode('utf-8')

if __name__ == "__main__":
    port = int(os.environ.get('PORT', 5000))
    app.run(debug=True, host='0.0.0.0', port=port)
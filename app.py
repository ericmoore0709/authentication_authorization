from flask import Flask, request, render_template, redirect, session, jsonify
from uuid import uuid4

app = Flask(__name__)

# session key
app.secret_key = str(uuid4())


@app.get('/')
def index():
    return render_template('index.html')

import os
from flask import Flask

from server.services.testingpathend import testthings

app = Flask(__name__)

@app.route('/')
def hello():
    return 'MathU Similarity Index Server'
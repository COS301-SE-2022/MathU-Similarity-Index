from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/10/', methods=['GET'])
def convertdr():
    text_input = str(request.args['query'])
    try:
        abc = float(text_input)
        Answer = str(math.radians(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
    	return "INVALID INPUT"

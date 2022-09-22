from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/15/', methods=['GET'])
def median_low():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.median_low(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"


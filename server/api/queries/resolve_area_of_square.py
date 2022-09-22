from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/6/', methods=['GET'])
def areasquare():
    text_input = str(request.args['query'])
    try:
        side = int(text_input)
        Area = side * side
        Answer =str(Area)
        Formula = str(side) + " × " + str(side)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)


@app.route('/api/3/', methods=['GET'])
def areaparrallelogram():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Area = base * height
        Formula = str(base) + "×" + str(height)
        Answer = str(Area)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/7/', methods=['GET'])
def areatrapezoid():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        firstbase = abc[0]
        secondbase = abc[1]
        height = abc[2]
        Area = 0.5*(firstbase*secondbase) * height
        Answer = str(round(Area, 3))
        Formula = "(" + str(firstbase) + "×" + str(secondbase) +")/2 × "+str(height);
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

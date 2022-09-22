from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/5/', methods=['GET'])
def arearhombus():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        diagonal1 = abc[0]
        diagonal2 = abc[1]
        Area = (diagonal1*diagonal2)/2
        Formula += "("+str(diagonal1)+"×"+str(diagonal2)+")/2"
        Answer = str(Area)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

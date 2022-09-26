  from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)


@app.route('/api/9/', methods=['GET'])
def compoundintrest():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        p = abc[0]
        t = abc[1]
        r = abc[2]
        ci = round(p * (pow((1 + r / 100), t)), 3)
        Answer = str(ci)
        Formula = "("+str(p)+" × " + "(" + str(1) + "("  + str(r) + "/100" ")" + "^" + str(t) +")"
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

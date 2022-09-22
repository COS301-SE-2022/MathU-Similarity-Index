from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/12/', methods=['GET'])
def geometricsequence():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        a = abc[0]
        r = abc[1]
        length = abc[2]
        geometric = [a * r ** (n - 1) for n in range(1, length + 1)]
        # Answer = "Common Ratio in the geometric sequence is:" + str(abc[0]) + "\n" + "First term in the geometric sequence is:" + str(
        #     abc[1]) + "\n" + "Nth term in the arithmetic sequence is:" + str(length) + "\n"
        Answer += "[" + ", ".join(str(i) for i in geometric) + "]"
        Formula = " _ "
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"



from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)

@app.route('/api/13/', methods=['GET'])
def mean():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.mean(abc))
    except Exception as e:
        return "INVALID INPUT"

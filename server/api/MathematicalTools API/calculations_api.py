from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)


# SIMULTANEOUS EQUATIONS
@app.route('/api/solvesimultaneousequation/', methods=['GET'])
def solvesimultaneousequation():
    text_input = str(request.args['query'])
    try:

        # text_input = "x+y=24:2*x-y=-6"

        equations = text_input.split(":")
        equation1 = equations[0].split(",")
        equation2 = equations[1].split(",")

        x, y = sym.symbols('x,y')
        a = eval(equation1[0])
        b = eval(equation1[1])
        c = eval(equation2[0])
        d = eval(equation2[1])
        eq1 = sym.Eq(a, b)
        eq2 = sym.Eq(c, d)
        result = sym.solve([eq1, eq2], (x, y))
        return str(result)
    except Exception as e:
        return "INVALID INPUT"

# AREA CIRCLE


@app.route('/api/areacircle/', methods=['GET'])
def areacircle():
    try:
        text_input = str(request.args['query'])
        r = int(text_input)
        Area = math.pi * r * r
        Answer = "Area of the circle: " + str(round(Area, 3))
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA PARRALLELOGRAM


@app.route('/api/areaparrallelogram/', methods=['GET'])
def areaparrallelogram():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Area = base * height
        Answer = "Area of the parrallelogram: " + str(Area)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA RECTANGLE


@app.route('/api/arearectangle/', methods=['GET'])
def arearectangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        length = abc[0]
        width = abc[1]
        Area = length * width
        Answer = "Area of the rectangle: " + str(Area)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA RHOMBUS


@app.route('/api/arearhombus/', methods=['GET'])
def arearhombus():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        diagonal1 = abc[0]
        diagonal2 = abc[1]
        Area = (diagonal1*diagonal2)/2
        Answer = "Area of the rhombus: " + str(Area)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA SQUARE


@app.route('/api/areasquare/', methods=['GET'])
def areasquare():
    text_input = str(request.args['query'])
    try:
        side = int(text_input)
        Area = side * side
        Answer = "Area of the square: " + str(Area)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA TRAPEZOID


@app.route('/api/areatrapezoid/', methods=['GET'])
def areatrapezoid():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        firstbase = abc[0]
        secondbase = abc[1]
        height = abc[2]
        Area = 0.5*(firstbase*secondbase) * height
        Answer = "Area of the trapezoid: " + str(round(Area, 3))
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA TRIANGLE


@app.route('/api/areatriangle/', methods=['GET'])
def areatriangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Area = (0.5*base) * height
        Answer = "Area of the triangle: " + str(Area)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER CIRCLE


@app.route('/api/perimetrecircle/', methods=['GET'])
def perimetrecircle():
    text_input = str(request.args['query'])
    try:
        r = int(text_input)
        Perimeter = math.pi * 2 * r
        Answer = "Perimeter of the circle: " + str(round(Perimeter, 3))
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER PARRALLELOGRAM


@app.route('/api/perimetreparrallelogram/', methods=['GET'])
def perimetreparrallelogram():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Perimetre = 2*(base + height)
        Answer = "Perimeter of the parrallelogram: " + str(Perimetre)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER RECTANGLE


@app.route('/api/perimetrerectangle/', methods=['GET'])
def perimetrerectangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        length = abc[0]
        width = abc[1]
        Perimeter = 2*length + 2 * width
        Answer = "Perimeter of the rectangle: " + str(Perimeter)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER RHOMBUS


@app.route('/api/perimetrerhombus/', methods=['GET'])
def perimetrerhombus():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        side = abc[0]
        Perimeter = side * 4
        Answer = "Perimeter of the rhombus: " + str(Perimeter)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER SQUARE


@app.route('/api/perimetresquare/', methods=['GET'])
def perimetresquare():
    text_input = str(request.args['query'])
    try:
        side = int(text_input)
        Perimeter = 4 * side
        Answer = "Perimeter of the square: " + str(Perimeter)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER TRAPEZOID


@app.route('/api/perimetretrapezoid/', methods=['GET'])
def perimetretrapezoid():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        firstbase = abc[0]
        secondbase = abc[1]
        firstside = abc[2]
        secondside = abc[3]
        Perimeter = firstbase + secondbase + firstside + secondside
        Answer = "Perimeter of the trapezoid: " + str(round(Perimeter, 3))
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER TRIANGLE


@app.route('/api/perimetretriangle/', methods=['GET'])
def perimetretriangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        side1 = abc[0]
        side2 = abc[1]
        base = abc[2]
        Perimeter = side1 + side2 + base
        Answer = "Perimeter of the triangle: " + str(Perimeter)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# SIMPLE INTREST


@app.route('/api/simpleintrest/', methods=['GET'])
def simpleintrest():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        p = abc[0]
        t = abc[1]
        r = abc[2]

        si = (p * t * r)/100
        Answer = "The total amount accrued, principal plus interest, from simple interest on a principal of R" + \
            str(abc[0]) + "  at a rate of " + str(abc[1]) + \
            "% per year for "+str(abc[2]) + " years is R" + str(si + abc[0])
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# COMPOUND INTREST


@app.route('/api/compoundintrest/', methods=['GET'])
def compoundintrest():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        p = abc[0]
        t = abc[1]
        r = abc[2]
        ci = round(p * (pow((1 + r / 100), t)), 3)
        Answer = "The total amount accrued, principal plus interest, from compound interest on a principal of R" + \
            str(abc[0]) + "  at a rate of " + str(abc[1]) + \
            "% per year for "+str(abc[2]) + " years is R" + str(ci)
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# ARITHMETIC SEQUENCE


@app.route('/api/arithmeticsequence/', methods=['GET'])
def arithmeticsequence():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        commonDifference = abc[0]
        firstTerm = abc[1]
        N = abc[2]
        nthTerm = firstTerm + (N - 1) * commonDifference
        arithmetic = [firstTerm +
                      (NI - 1)*commonDifference for NI in range(1, N + 1)]
        Answer = "Common Difference in the arithmetic sequence is:" + str(abc[0]) + "\n" + "First term in the arithmetic sequence is:" + str(
            abc[1]) + "\n" + "Nth term in the arithmetic sequence is:" + str(nthTerm) + "\n"
        Answer += "[" + ", ".join(str(i) for i in arithmetic) + "]" + "\n"
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# GEOMETRIC SEQUENCE


@app.route('/api/geometricsequence/', methods=['GET'])
def geometricsequence():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        a = abc[0]
        r = abc[1]
        length = abc[2]
        geometric = [a * r ** (n - 1) for n in range(1, length + 1)]
        Answer = "Common Ratio in the geometric sequence is:" + str(abc[0]) + "\n" + "First term in the geometric sequence is:" + str(
            abc[1]) + "\n" + "Nth term in the arithmetic sequence is:" + str(length) + "\n"
        Answer += "[" + ", ".join(str(i) for i in geometric) + "]"
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# QUADRATIC EQUATION


@app.route('/api/quadraticequation/', methods=['GET'])
def quadraticequation():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc[0] = abc[0].replace('(', '')
        abc[0] = abc[0].replace(')', '')
        abc[1] = abc[1].replace('(', '')
        abc[1] = abc[1].replace(')', '')
        abc[2] = abc[2].replace('(', '')
        abc[2] = abc[2].replace(')', '')
        abc = list(map(int, abc))

        a = abc[0]
        b = abc[1]
        c = abc[2]
        # calculate the discriminant
        d = (b**2) - (4*a*c)
        # find two solutions
        sol1 = (-b-cmath.sqrt(d))/(2*a)
        sol2 = (-b+cmath.sqrt(d))/(2*a)

        Answer = "Solution 1: " + \
            str(round(sol1.real, 3)) + "\n" + \
            " Solution 2: " + str(round(sol2.real, 3))
        return Answer
    except Exception as e:
        return "INVALID INPUT"

# LINEAR FUNCTION
# @app.route('/api/plotlinearfunction/',methods = ['GET'])
# def plotlinearfunction():
# 	x = np.linspace(-5,5,100)
# 	a = "2*x+1"
# 	y = 2*x+1
# 	plt.plot(x, y, '-r',label=a)
# 	plt.title('Graph of: '+ a)
# 	plt.xlabel('x', color='#1C2833')
# 	plt.ylabel('y', color='#1C2833')
# 	plt.legend(loc='upper left')
# 	plt.grid()
# 	return plt

#MEAN (STATISTICS)


@app.route('/api/mean/', methods=['GET'])
def mean():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.mean(abc))
    except Exception as e:
        return "INVALID INPUT"

#MEDIAN (STATISTICS)


@app.route('/api/median/', methods=['GET'])
def median():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.median(abc))
    except Exception as e:
        return "INVALID INPUT"


#MEDIAN_HIGH (STATISTICS)
@app.route('/api/median_high/', methods=['GET'])
def median_high():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.median_high(abc))
    except Exception as e:
        return "INVALID INPUT"

#MEDIAN_LOW (STATISTICS)


@app.route('/api/median_low/', methods=['GET'])
def median_low():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.median_low(abc))
    except Exception as e:
        return "INVALID INPUT"

#MODE (STATISTICS)


@app.route('/api/mode/', methods=['GET'])
def mode():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.mode(abc))
    except Exception as e:
        return "INVALID INPUT"


#STDEV (STATISTICS)
@app.route('/api/stdev/', methods=['GET'])
def stdev():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.stdev(abc))
    except Exception as e:
        return "INVALID INPUT"


#PSTDEV (STATISTICS)
@app.route('/api/pstdev/', methods=['GET'])
def pstdev():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.pstdev(abc))
    except Exception as e:
        return "INVALID INPUT"

#VARIANCE (STATISTICS)


@app.route('/api/variance/', methods=['GET'])
def variance():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.variance(abc))
    except Exception as e:
        return "INVALID INPUT"

#PVARIANCE (STATISTICS)


@app.route('/api/pvariance/', methods=['GET'])
def pvariance():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.pvariance(abc))
    except Exception as e:
        return "INVALID INPUT"

# CONVERTDR


@app.route('/api/convertdr/', methods=['GET'])
def convertdr():
    text_input = str(request.args['query'])
    # try:
    abc = float(text_input)
    return str(math.radians(abc))
    # except Exception as e:
    # 	return "INVALID INPUT"

# CONVERTRD


@app.route('/api/convertrd/', methods=['GET'])
def convertrd():
    text_input = request.args['query']
    try:
        abc = float(text_input)
        return str(math.degrees(abc))
    except Exception as e:
        return "INVALID INPUT"


if __name__ == '__main__':
    app.run(port=5001)

from flask import Flask, request, jsonify
import matplotlib.pyplot as plt
import numpy as np
import sympy as sym
import cmath
import math
import statistics

app = Flask(__name__)


# SIMULTANEOUS EQUATIONS
@app.route('/api/19/', methods=['GET'])
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
        Formula = ""
        return Formula+"separator"+str(result)
    except Exception as e:
        return "INVALID INPUT"

# AREA CIRCLE


@app.route('/api/2/', methods=['GET'])
def areacircle():
    try:
        text_input = str(request.args['query'])
        r = int(text_input)
        Area = math.pi * r * r
        Answer = str(round(Area, 3))
        Formula = 'π' + str(r) + f'\N{SUPERSCRIPT TWO}'

        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA PARRALLELOGRAM


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

# AREA RECTANGLE


@app.route('/api/4/', methods=['GET'])
def arearectangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        length = abc[0]
        width = abc[1]
        Area = length * width
        Answer = str(Area)
        Formula = str(length) + "×" + str(width);
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA RHOMBUS


@app.route('/api/5/', methods=['GET'])
def arearhombus():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        diagonal1 = abc[0]
        diagonal2 = abc[1]
        Area = (diagonal1*diagonal2)/2
        Formula + "("+str(diagonal1)+"×"+str(diagonal2)+")/2"
        Answer = str(Area)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# AREA SQUARE


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

# AREA TRAPEZOID


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

# AREA TRIANGLE


@app.route('/api/8/', methods=['GET'])
def areatriangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Area = (0.5*base) * height
        Answer = str(Area)
        Formula = "(" + str(base) + " × " + str(height) + ")/2"
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER CIRCLE


@app.route('/api/25/', methods=['GET'])
def perimetrecircle():
    text_input = str(request.args['query'])
    try:
        r = int(text_input)
        Perimeter = math.pi * 2 * r
        Formula = "2π"+ str(r)
        Answer = str(round(Perimeter, 3))
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER PARRALLELOGRAM


@app.route('/api/26/', methods=['GET'])
def perimetreparrallelogram():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        base = abc[0]
        height = abc[1]
        Perimetre = 2*(base + height)
        Formula = "2("+str(base) + " + " + str(height)+")"
        Answer = str(Perimetre)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER RECTANGLE


@app.route('/api/31/', methods=['GET'])
def perimetrerectangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        length = abc[0]
        width = abc[1]
        Perimeter = 2*length + 2 * width
        Answer = str(Perimeter)
        Formula = "2("+str(length)+"+"+str(width)+")"
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER RHOMBUS


@app.route('/api/27/', methods=['GET'])
def perimetrerhombus():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        side = abc[0]
        Perimeter = side * 4
        Formula = "4×"+str(side)
        Answer = str(Perimeter)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER SQUARE


@app.route('/api/28/', methods=['GET'])
def perimetresquare():
    text_input = str(request.args['query'])
    try:
        side = int(text_input)
        Perimeter = 4 * side
        Formula = "4×"+str(side)
        Answer = str(Perimeter)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER TRAPEZOID


@app.route('/api/29/', methods=['GET'])
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
        Formula = str(firstbase) + " + " + str(secondbase) + " + " + str(firstside) + " + " + str(secondside)
        Answer = str(round(Perimeter, 3))
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# PERIMETER TRIANGLE


@app.route('/api/30/', methods=['GET'])
def perimetretriangle():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        side1 = abc[0]
        side2 = abc[1]
        base = abc[2]
        Perimeter = side1 + side2 + base
        Formula = str(side1) + " + " + str(side2) + " + " + str(base)
        Answer = str(Perimeter)
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# SIMPLE INTREST


@app.route('/api/20/', methods=['GET'])
def simpleintrest():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(",")
        abc = list(map(int, abc))
        p = abc[0]
        t = abc[1]
        r = abc[2]

        si = (p * t * r)/100
        Formula = "(" + str(p) + " × " + str(t) + " × " + str(r) + "/100"
        Answer = str(si + abc[0])
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# COMPOUND INTREST


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

# ARITHMETIC SEQUENCE


@app.route('/api/1/', methods=['GET'])
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
        # Answer = "Common Difference in the arithmetic sequence is:" + str(abc[0]) + "\n" + "First term in the arithmetic sequence is:" + str(
        #     abc[1]) + "\n" + "Nth term in the arithmetic sequence is:" + str(nthTerm) + "\n"
        Answer = "[" + ", ".join(str(i) for i in arithmetic) + "]" + "\n"
        Formula = ""
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# GEOMETRIC SEQUENCE


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

# QUADRATIC EQUATION


@app.route('/api/18/', methods=['GET'])
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
        Formula = ""
        return Formula+"separator"+Answer
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


@app.route('/api/13/', methods=['GET'])
def mean():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        return str(statistics.mean(abc))
    except Exception as e:
        return "INVALID INPUT"

#MEDIAN (STATISTICS)


@app.route('/api/14/', methods=['GET'])
def median():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.median(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"


#MEDIAN_HIGH (STATISTICS)
@app.route('/api/16/', methods=['GET'])
def median_high():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.median_high(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

#MEDIAN_LOW (STATISTICS)


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

#MODE (STATISTICS)


@app.route('/api/17/', methods=['GET'])
def mode():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.mode(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"


#STDEV (STATISTICS)
@app.route('/api/21/', methods=['GET'])
def stdev():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.stdev(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"


#PSTDEV (STATISTICS)
@app.route('/api/23/', methods=['GET'])
def pstdev():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.pstdev(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

#VARIANCE (STATISTICS)


@app.route('/api/22/', methods=['GET'])
def variance():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.variance(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

#PVARIANCE (STATISTICS)


@app.route('/api/24/', methods=['GET'])
def pvariance():
    text_input = str(request.args['query'])
    try:
        abc = text_input.split(".")
        abc = list(map(int, abc))
        Answer = str(statistics.pvariance(abc))
        Formula = text_input
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"

# CONVERTDR


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

# CONVERTRD


@app.route('/api/11/', methods=['GET'])
def convertrd():
    text_input = request.args['query']
    try:
        abc = float(text_input)
        Answer = str(math.degrees(abc))
        Formula = str(abc) + " × (180/π)" 
        return Formula+"separator"+Answer
    except Exception as e:
        return "INVALID INPUT"


if __name__ == '__main__':
    app.run(port=5001)

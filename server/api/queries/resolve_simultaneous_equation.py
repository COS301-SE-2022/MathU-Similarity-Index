
from flask import Flask, request, jsonify
import sympy as sym

app = Flask(__name__)

@app.route('/api',methods = ['GET'])

def solvesimultaneousequation():
	text_input = str(request.args['query'])
	try:

		# text_input = "x+y=24:2*x-y=-6"

		equations = text_input.split(":")
		equation1 = equations[0].split(",")
		equation2 = equations[1].split(",")


		x,y = sym.symbols('x,y')
		a =  eval(equation1[0])
		b =  eval(equation1[1])
		c =  eval(equation2[0])
		d =  eval(equation2[1])
		eq1 = sym.Eq(a,b)
		eq2 = sym.Eq(c,d)
		result = sym.solve([eq1,eq2],(x,y))
		return str(result)
	except Exception as e:
		return "INVALID INPUT"

if __name__ == '__main__':
	app.run()

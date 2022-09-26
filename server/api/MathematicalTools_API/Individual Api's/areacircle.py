from flask import Flask, request, jsonify
import math
app = Flask(__name__)
@app.route('/api/areacircle/',methods = ['GET'])
def areacircle():
	try:
		text_input = str(request.args['query'])
		r = int(text_input)
		Area = math.pi * r * r
		Answer = "Area of the circle: " + str(round(Area,3))
		return Answer
	except Exception as e:
		return "INVALID INPUT"
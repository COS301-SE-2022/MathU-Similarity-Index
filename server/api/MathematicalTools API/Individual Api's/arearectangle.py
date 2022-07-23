from flask import Flask, request, jsonify
app = Flask(__name__)
@app.route('/api/arearectangle/',methods = ['GET'])
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

from flask import Flask, request, jsonify
app = Flask(__name__)
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


if __name__ == '__main__':
	app.run()

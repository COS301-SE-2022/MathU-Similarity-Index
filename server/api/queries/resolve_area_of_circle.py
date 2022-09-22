from flask import Flask, request, jsonify
import math
app = Flask(__name__)
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

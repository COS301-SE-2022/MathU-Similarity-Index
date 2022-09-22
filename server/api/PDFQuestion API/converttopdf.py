from flask import Flask, request, jsonify
import subprocess
import os
app = Flask(__name__)


@app.route('/converttopdf/', methods=['GET'])
def createpdf():
    text_input = str(request.args['query'])

    idwithquestions = text_input.split("*_*")
    document_id = idwithquestions[0]
    equations = idwithquestions[1]
    individualequations = equations.split("*()*")

    with open(document_id +'.tex','w') as file:
        file.write('\\documentclass{article}\n')
        file.write('\\begin{document}\n')

        for x in range(len(individualequations)):
            file.write('\\begin{equation}\n')
            file.write(individualequations[x])
            file.write('\\end{equation}\n')
            pass
            
        file.write('\\end{document}\n')

    x = subprocess.call('pdflatex '+document_id+ '.tex')
    os.system('start '+document_id+'.pdf')
    return document_id

if __name__ == '__main__':
    app.run(port=5001)
import json
from latex2sympy2 import latex2sympy

#this function converts a json file to a txt file (replacing duplicate backslashes with single ones)
def removeBackslashes(filename):
    file = open(filename, "r")
    jsonString = file.read()
    latexList = json.loads(jsonString)

    for i in range(len(latexList["data"])):
        latexList["data"][i] = latexList["data"][i].replace("\\\\", "\\")
        with open("clean_output.txt", "a") as writer:
            writer.write(latexList["data"][i])
            writer.write("\n")

def detectCorruptLatex(latexIn):
    try:
        latex2sympy(latexIn)
        #print("passed latex test! "+ latexIn)
        return True
    except:
        print("corrupt latex detected:" + latexIn)
        return False
    return False
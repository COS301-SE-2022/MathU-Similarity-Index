import re

#equations
def tag_equation(latexIn):
    equalPos = latexIn.find('=')
    if equalPos == -1:
        return False
    else:
        if(len(latexIn[:equalPos]) > 0 and len(latexIn[equalPos+1:]) > 0):
            return True

#functions
def tag_function(latexIn):
    equalPos = latexIn.find('=')
    if equalPos == -1:
        return False
    else:
        if(re.search("{?[a-zA-Z]}?'*[(][a-zA-Z][)]", latexIn[:equalPos]) != None):
            print(latexIn)
            return True
        else:
            return False

"""
Might want to differentiate between equations and functions.
eg. f(x) = x^2 and x+3+y = 2x+2y

Note, f'(x) = ... is also a function.
"""

#inequalites
def tag_inequality(latexIn):
    if(latexIn.find('<') == -1 and latexIn.find('>') == -1 and latexIn.find('<=') == -1 and latexIn.find('>=') == -1):
        return False
    else:
        print(latexIn)
        return True

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

def tag_differentiation(latexIn):
    if(re.search("[{][a-zA-Z][}]'+", latexIn) != None or re.search("prime", latexIn) != None): #alternate notation for prime
        print(latexIn)
        return True
    else:
        return False

def tag_integration(latexIn): #afaik no integration in the databse provided, or none with \int in the LaTeX, if another wway of LaTeX exists add later
    if(re.search("int", latexIn) != None):
        print(latexIn)
        return True
    else:
        return False

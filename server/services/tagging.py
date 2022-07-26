import re

#equations
def tag_equation(latexIn):
    equalPos = latexIn.find('=')
    if equalPos == -1:
        return False
    else:
        if(len(latexIn[:equalPos]) > 0 and len(latexIn[equalPos+1:]) > 0):
            return True
        else:
            return False

#statements
def tag_statement(latexIn):
    if(latexIn.find('=') == -1):
        return True
    else:
        return False

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

#stuff that contains differentiation
def tag_differentiation(latexIn):
    if(re.search("[{][a-zA-Z][}]'+", latexIn) != None or re.search("prime", latexIn) != None): #alternate notation for prime
        print(latexIn)
        return True
    else:
        return False

#stuff that contains integration
def tag_integration(latexIn): #afaik no integration in the databse provided, or none with \int in the LaTeX, if another wway of LaTeX exists add later
    if(re.search("int", latexIn) != None):
        print(latexIn)
        return True
    else:
        return False

#stuff that contains trigonometry
def tag_trigonemtric(latexIn):
    if(re.search("sin", latexIn) != None or re.search("cos", latexIn) != None or re.search("tan", latexIn) != None):
        print(latexIn)
        return True
    else:
        return False

#stuff that contains limits        
def tag_limits(latexIn):
    if(re.search("lim", latexIn) != None):
        print(latexIn)
        return True
    else:
        return False

#stuff that contains surds
def tag_surds(latexIn):
    if(re.search("sqrt", latexIn) != None):
        print(latexIn)
        return True
    else:
        return False

#quadratic stuff (not entirely perfect yet but good enough for now)
def tag_quadratic(latexIn):
    #print(latexIn)
    if(tag_function(latexIn) == True):
        #print("Found a function")
        equalPos = latexIn.find('=')
        #print("Substring: " + latexIn[equalPos+1:])
        return tag_quadratic(latexIn[equalPos+1:])
    else:
        varPos = latexIn.find(r'^{2}')
        if(varPos != -1):
            if(latexIn.find('^') != latexIn.rfind('^')):
                #check to see if duplicate square check works or not
                #print("DUPLICATE SQAURES: " + latexIn)
                return False
            else:
                var = latexIn[varPos-1]
                #check for brackets - not in standard form so is false
                #adding the check for white spaces removes problems of the form cos^2(x) + cos(x) + 1 (may or may not be a problem)
                if(var == ")" or var == "}" or var == " "):
                    return False

                if(latexIn[:varPos-1].find(var) != -1 or latexIn[varPos+3:].find(var) != -1):
                    #check to see if variable is in the equation (other than where it is squared)
                    print(latexIn)
                    return True
        else:
            return False
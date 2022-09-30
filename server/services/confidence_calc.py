from services.tagging import *
import latex2mathml.converter
from rapidfuzz.distance import Levenshtein

def get_all(search_query, dataset, problem_index, cols): #++ sim_distance
    results = []
    # for id, problem, user_search, has_memo, similarity in dataset:
    #     similarity = get_conf(search_query, problem)
    #     results.append((id, problem, user_search, has_memo, similarity,))

    for row in dataset:
        current_problem = row[problem_index]
        sim_distance = get_conf(search_query, current_problem)
        new_row = row + (sim_distance,)
        results.append(new_row)

    output = sorted(results, key=lambda data: data[cols])

    return output

def close_finder(input):
    """
    Returns the content between the furthest closing tag and the end of the string
    """
    current = len(input) - 1
    while(input[current] != '>'):
        current -= 1
    return input[current+1 : len(input)]

def get_similarity(a, b):
    """
    Returns the similarity between two strings.
    """
    if a == b:
        return 1
    #if not a or not b: #not sure i need this or not
    #    return 0
    #print("A= "+a)
    #print("B= "+b)
    length_value = 3*(1 - len(set(a) & set(b)) / len(set(a + b))) 
    #print("Length Value:",length_value)
    #print("now A= "+a)
    #print("now B= "+b)
    a_variables = a.split("</mi>")
    #print ("a_variable_count:", len(a_variables)-1)
    #print ("A Variables:",a_variables)
    b_variables = b.split("</mi>")
    #print ("b_variable_count:", len(b_variables)-1)
    #print ("B Variables:",b_variables)
    v_difference = abs((len(a_variables) - 1) - (len(b_variables) - 1))
   # print ("Variable Difference:",v_difference)
    a_operators_ml = a.split("</mo>")
    a_operators = []
    for i in range(len(a_operators_ml)-1):
        a_operators.append(close_finder(a_operators_ml[i]))
    b_operators_ml = b.split("</mo>")
    b_operators = []
    for i in range(len(b_operators_ml)-1):
        b_operators.append(close_finder(b_operators_ml[i]))
    #print ("a_operator_count:", len(a_operators))
    #print ("A Operators:",a_operators)
    #print ("b_operator_count:", len(b_operators))
    #print ("B Operators:",b_operators)
    o_count_difference = abs((len(a_operators) - 1) - (len(b_operators) - 1))
    #print ("Operator Count Difference:",o_count_difference)
    o_difference = 0
    for i in range(len(a_operators)):
        if(i < len(b_operators)):
            if a_operators[i] != b_operators[i]:
                o_difference += 1
        else:
            o_difference += 1
    #print ("Operator Difference:",o_difference)

    #return 0.5 * (length_value + v_difference + 0.1 * (o_count_difference + o_difference))
    return 0.5 * (length_value + v_difference + o_count_difference + o_difference)
    #return length_value + v_difference + o_count_difference + o_difference

def get_tag_sim(a,b):
    binaryA = ""
    binaryB = ""

    #equations
    if(tag_equation(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_equation(b)):
        binaryB += "1"
    else:
        binaryB += "0"
    
    #statements
    if(tag_statement(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_statement(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #functions
    if(tag_function(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_function(b)):
        binaryB += "1"
    else:
        binaryB += "0"
    
    #inequalities
    if(tag_inequality(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_inequality(b)):
        binaryB += "1"
    else:
        binaryB += "0"
    
    #differentation
    if(tag_differentiation(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_differentiation(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #integration
    if(tag_integration(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_integration(b)):
        binaryB += "1"

    #trigonometric
    if(tag_trigonemtric(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_trigonemtric(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #limits
    if(tag_limits(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_limits(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #surds
    if(tag_surds(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_surds(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #summations
    if(tag_summation(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_summation(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #matrices
    if(tag_matrix(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_matrix(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #logarithms
    if(tag_logarithm(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_logarithm(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #natural logs
    if(tag_natural_log(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_natural_log(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #quadratic
    if(tag_quadratic(a)):
        binaryA += "1"
    else:
        binaryA += "0"
    if(tag_quadratic(b)):
        binaryB += "1"
    else:
        binaryB += "0"

    #compare the two binary strings and count the differences
    difference = 0
    for j in range(len(binaryA)-1):
        if(binaryA[j] != binaryB[j]):
            difference += 1
    
    return difference

#a is the search query, b is the problem
def get_conf(a, b):

    try:
        mathmlA = latex2mathml.converter.convert(a)
        mathmlB = latex2mathml.converter.convert(b)

        #print(mathmlA)
        #print(mathmlB)

        mathmlsim = get_similarity(mathmlA,mathmlB)

        #print("before")
        tagsim = get_tag_sim(a,b)

        lsim = Levenshtein.distance(a, b)
        #print("after")
        #return lsim + 0.2*tagsim
        return lsim #+ 0.2*tagsim

    except:
        #print("A whoopsie occured! " + a + " " + b)
        return 999999999 #if there is an error, return big number
    

#print(latex2mathml.converter.convert(r"x^2+y^2"))
# results = get_all(r"x^2+y^2")
# print(results)

#print("run1")
#print(get_similarity(latex2mathml.converter.convert(r"x^2+y^2"), latex2mathml.converter.convert(r"x^2")))
#print("run2")
#print(get_similarity(latex2mathml.converter.convert(r"x^2+y^2"), latex2mathml.converter.convert(r"x^2+y^2+z^2")))


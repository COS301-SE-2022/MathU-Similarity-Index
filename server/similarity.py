import os

def read_file():
    """
    Reads a file and returns the contents. This needs to work with the database and not a file!
    """
    problems_mathml = []
    dirname = os.path.dirname(__file__)
    filename = os.path.join(dirname, 'db/final_output.txt')
    f = open(filename, "r", encoding="utf8")
    for i in f:
        problems_mathml.append(i)
    return problems_mathml

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
    length_value = 3*(1 - len(set(a) & set(b)) / len(set(a + b))) 
    #print("Length Value:",length_value)
    a_variables = a.split("</mi>")
    #print ("a_variable_count:", len(a_variables)-1)
    #print ("A Variables:",a_variables)
    b_variables = b.split("</mi>")
    #print ("b_variable_count:", len(b_variables)-1)
    #print ("B Variables:",b_variables)
    v_difference = abs((len(a_variables) - 1) - (len(b_variables) - 1))
    #print ("Variable Difference:",v_difference)
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

    return length_value + 2*v_difference + o_count_difference + o_difference


def search_similarity(problems, searchQuery):
    '''
    Orders the list of problems in the database by similarity.
    '''
    #problems = read_file()
    
    list = []
    for i in range(len(problems)):
        list.append({'problem':problems[i], 'similarity':get_similarity(searchQuery, problems[i])})
    
    def myFunc(e):
        return e['similarity']

    list.sort(key=myFunc)
    #print(list)

    return list
    
search_similarity("<math xmlns=\"http://www.w3.org/1998/Math/MathML\">  <msup>    <mi>g</mi>    <mrow>      <mi data-mjx-alternate=\"1\" mathvariant=\"normal\">′</mi>    </mrow>  </msup>  <mo stretchy=\"false\">(</mo>  <mi>x</mi>  <mo stretchy=\"false\">)</mo>  <mo>=</mo>  <mo>−</mo>  <mn>6</mn>  <msup>    <mi>x</mi>    <mrow>      <mn>2</mn>    </mrow>  </msup>  <mo>+</mo>  <mn>6</mn>  <mi>x</mi>  <mo>+</mo>  <mn>12</mn></math>")

from codecs import utf_8_decode
from itertools import count
from locale import normalize
from similarity import close_finder, get_similarity, read_file, search_similarity

problems = read_file()

# print(problems[0])

list = search_similarity(read_file(), "<math xmlns=\"http://www.w3.org/1998/Math/MathML\">  <msup>    <mi>g</mi>    <mrow>      <mi data-mjx-alternate=\"1\" mathvariant=\"normal\">′</mi>    </mrow>  </msup>  <mo stretchy=\"false\">(</mo>  <mi>x</mi>  <mo stretchy=\"false\">)</mo>  <mo>=</mo>  <mo>−</mo>  <mn>6</mn>  <msup>    <mi>x</mi>    <mrow>      <mn>2</mn>    </mrow>  </msup>  <mo>+</mo>  <mn>6</mn>  <mi>x</mi>  <mo>+</mo>  <mn>12</mn></math>")

list_len = len(list)
min_sim = 0
max_sim = list[list_len-1]['similarity']
print("Max Sim: " + str(max_sim))

for i in range(list_len):
    sim = list[i]['similarity']
    inverse_sim = max_sim - sim
    normalized_sim = inverse_sim / (max_sim) * 100
    # print(str(i) + ": " + str(normalized_sim) + "%")

    list[i]['similarity'] = normalized_sim

# print(list[0]['similarity'])

problems = read_file()

indexed_problems = search_similarity(problems, "test")
indexed_problems_len = len(indexed_problems)
min_sim = 0
max_sim = list[indexed_problems_len-1]['similarity']

if(max_sim == 0):
    max_sim = 1

equations = []

for i in range(indexed_problems_len):
    sim = indexed_problems[i]['similarity']
    inverse_sim = max_sim - sim
    normalized_sim = inverse_sim / (max_sim) * 100

    indexed_problems[i]['similarity'] = normalized_sim

    equations.append({
        "equation": {
            "id": indexed_problems[i]['id'],
            "mathml": indexed_problems[i]['problem'],
            "latex": "undefined",
            "type": "unknown",
            "category": "unknown"
        },
        "similarity": indexed_problems[i]['similarity']
    })

payload = {
    "numberofresults": indexed_problems_len,
    "equations": equations[1]
}

print(payload)

payload = {
    "numberofresults": 2,
    "equations": [
        {
            "equation": {
                "id": 1,
                "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "latex": "1+2",
                "type": "Equation",
                "category": "Addition"
            },
            "similarity": 0
        },
        {
            "equation": {
                "id": 2,
                "mathml": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "latex": "3-2",
                "type": "Equation",
                "category": "Subtraction"
            },
            "similarity": 0
        }
    ]
}

print(payload)
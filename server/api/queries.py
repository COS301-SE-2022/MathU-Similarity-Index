from codecs import utf_8_encode


def resolve_test(obj, info):
    return utf_8_encode("Hello World!")

def resolve_getAllEquations(obj, info):
    payload = [
        {
            "id": 1,
            "MathML": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
            "LaTeX": {"1+2"},
            "Type": "Equation",
            "Category": "Addition"
        },
        {
            "id": 2,
            "MathML": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
            "LaTeX": {"3-2"},
            "Type": "Equation",
            "Category": "Subtraction"
        }
    ]
    return payload

def resolve_search(obj, info, input):
    payload = {
        "numberOfResults": 2,
        "Equations": [
            {
                "Equation": {
                    "id": 1,
                    "MathML": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                    "LaTeX": "1+2",
                    "Type": "Equation",
                    "Category": "Addition"
                },
                "Similarity": 0
            },
            {
                "Equation": {
                    "id": 2,
                    "MathML": "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                    "LaTeX": "3-2",
                    "Type": "Equation",
                    "Category": "Subtraction"
                },
                "Similarity": 0
            }
        ]
    }
    return payload
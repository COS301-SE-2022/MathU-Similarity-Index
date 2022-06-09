def resolve_api_status(obj, info):
    return f'API is running'

def resolve_get_all_equations(obj, info):
    payload = [
        {
            "id": 3,
            "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>',
            "latex": "1+2",
            "type": "Equation",
            "category": "Addition"
        },
        {
            "id": 2,
            "mathml": f'<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>',
            "latex": "3-2",
            "type": "Equation",
            "category": "Subtraction"
        }
    ]
    return payload

def resolve_search(obj, info, input):
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
    return payload
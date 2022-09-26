def resolve_math_api_data(obj, info, apikey):
    print("resolve_math_api_data")
    payload = [
        {
            "calculationid":0,
            "calculationname":"Arithmetic Sequence",
            "inputfields":[
                "Common Difference",
                "First Term",
                "Nth Term"
            ]
        },
        {
            "calculationid":1,
            "calculationname":"Area Circle",
            "inputfields":[
                "Radius"
            ]
        },
        {
            "calculationid":2,
            "calculationname":"Area Parrallelogram",
            "inputfields":[
                "Base",
                "Height"
            ]
        },
        {
            "calculationid":3,
            "calculationname":"Area Rectangle",
            "inputfields":[
                "Length",
                "Width"
            ]
        },
        {
            "calculationid":4,
            "calculationname":"Area Rhombus",
            "inputfields":[
                "Diagonal 1",
                "Diagonal 2"
            ]
        },
        {
            "calculationid":5,
            "calculationname":"Area Square",
            "inputfields":[
                "Side"
            ]
        },
        {
            "calculationid":6,
            "calculationname":"Area Trapezoid",
            "inputfields":[
                "First Base",
                "Second Base",
                "Height"
            ]
        },
        {
            "calculationid":7,
            "calculationname":"Area Triangle",
            "inputfields":[
                "Base",
                "Height"
            ]
        },
        {
            "calculationid":8,
            "calculationname":"Compound Intrest",
            "inputfields":[
                "Initial Principal Balance",
                "Annual Interest Rate",
                "Time(years)"
            ]
        },
        {
            "calculationid":9,
            "calculationname":"Convert Degrees to Radians",
            "inputfields":[
                "Degrees"
            ]
        },
        {
            "calculationid":10,
            "calculationname":"Convert Radians to Degrees",
            "inputfields":[
                "Radians"
            ]
        },
        {
            "calculationid":11,
            "calculationname":"Geometric Sequence",
            "inputfields":[
                "Common Ratio",
                "First Term",
                "Number of Terms"
            ]
        },
        {
            "calculationid":12,
            "calculationname":"Mean",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":13,
            "calculationname":"Median",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":14,
            "calculationname":"Median Low",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":15,
            "calculationname":"Median High",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":16,
            "calculationname":"Mode",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":17,
            "calculationname":"Quadratic Equation",
            "inputfields":[
                "a",
                "b",
                "c"
            ]
        },
        {
            "calculationid":18,
            "calculationname":"Simultaneous Equations",
            "inputfields":[
                "Equation 1",
                "Equation 2"
            ]
        },
        {
            "calculationid":19,
            "calculationname":"Simple Interest",
            "inputfields":[
                "Initial Principal Balance",
                "Annual Interest Rate",
                "Time(years)"
            ]
        },
        {
            "calculationid":20,
            "calculationname":"Sample Standard Deviation",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":21,
            "calculationname":"Sample Variance",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":22,
            "calculationname":"Population Standard Deviation",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":23,
            "calculationname":"Population Variance",
            "inputfields":[
                "Data"
            ]
        },
        {
            "calculationid":24,
            "calculationname":"Perimeter Circle",
            "inputfields":[
                "Radius"
            ]
        },
        {
            "calculationid":25,
            "calculationname":"Perimeter Parrallelogram",
            "inputfields":[
                "Base",
                "Height"
            ]
        },
        {
            "calculationid":26,
            "calculationname":"Perimeter Rhombus",
            "inputfields":[
                "Side"
            ]
        },
        {
            "calculationid":27,
            "calculationname":"Perimeter Square",
            "inputfields":[
                "Side"
            ]
        },
        {
            "calculationid":28,
            "calculationname":"Perimeter Trapezoid",
            "inputfields":[
                "First Base",
                "Second Base",
                "First Side",
                "Second Side"
            ]
        },
        {
            "calculationid":29,
            "calculationname":"Perimeter Triangle",
            "inputfields":[
                "Side 1",
                "Side 2",
                "Base"
            ]
        },
        {
            "calculationid":30,
            "calculationname":"Perimeter Rectangle",
            "inputfields":[
                "Length",
                "Width"
            ]
        }
    ]
    return payload
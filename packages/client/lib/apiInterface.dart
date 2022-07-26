//imports
import 'package:http/http.dart';
import 'dart:convert';

/*
Note:
################################################################################
This class will be used to define all methods used to make API calls. An object
of this class should be instatiated in whichever file wishes to make an API
call. This is done to adhere to DRY coding standards
################################################################################
*/

//Code
class API_Interface {
  //Attributes
  Uri url = Uri.parse("http://127.0.0.1:5000/graphql");

  Map<String, String> headerElements = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  String query = '';

  //Methods
  Future<List<dynamic>> getSearchResults(String qry) async {
    //Variables
    query = 'query search{' +
        'Search(input: "$qry"){' +
        'numberofresults,equations{' +
        'equation{id,latex},similarity}}}';

    List<dynamic> temp = [];

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    int numberofresults = data['data']['Search']['numberofresults'];

    List<dynamic> equations = data['data']['Search']['equations'];

    for (int i = 0; i < numberofresults; i++) {
      temp.add(equations[i]);
    }

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getSearchHistory(String uid) async {
    //Variables
    query = 'query history{' +
        'History(input: "$uid"){' +
        'numberofresults,equations{' +
        'equation{id,latex},similarity}}}';

    List<dynamic> temp = [];

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    int numberofresults = data['data']['History']['numberofresults'];

    List<dynamic> equations = data['data']['History']['equations'];

    for (int i = 0; i < numberofresults; i++) {
      temp.add(equations[i]);
    }

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getSavedResults(String uid) async {
    //Variables
    query = 'query saved{' +
        'SavedResults(input: "$uid"){' +
        'numberofresults,equations{' +
        'equation{id,latex},similarity}}}';

    List<dynamic> temp = [];

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    int numberofresults = data['data']['SavedResults']['numberofresults'];

    List<dynamic> equations = data['data']['SavedResults']['equations'];

    for (int i = 0; i < numberofresults; i++) {
      temp.add(equations[i]);
    }

    //Return Statement
    return temp;
  }

/*
################################################################################
Methods below this line should be deleted
################################################################################
*/

  //To Test Display of Results
  List<dynamic> getSearchResultsForced() {
    var res = jsonEncode({
      "data": {
        "Search": {
          "equations": [
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Addition",
                "id": "1",
                "latex": "1+2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
            {
              "equation": {
                "category": "Subtraction",
                "id": "2",
                "latex": "3-2",
                "mathml":
                    "<math xmlns=\"http://www.w3.org/1998/Math/MathML\"><mrow><mn>3</mn><mo>-</mo><mn>2</mn></mrow></math>",
                "type": "Equation"
              },
              "similarity": 0
            },
          ],
          "numberofresults": 2
        }
      }
    });

    List<dynamic> temp = [];

    Map<dynamic, dynamic> data = jsonDecode(res);

    int numberofresults = data['data']['Search']['numberofresults'];

    List<dynamic> equations = data['data']['Search']['equations'];

    for (int i = 0; i < equations.length; i++) {
      temp.add(equations[i]);
    }

    return temp;
  }
}

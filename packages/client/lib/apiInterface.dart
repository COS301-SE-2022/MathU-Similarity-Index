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
}

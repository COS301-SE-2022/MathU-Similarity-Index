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
  //Singleton Class Declaration
  static final API_Interface _apiObj = new API_Interface._internal();

  factory API_Interface() {
    return _apiObj;
  }

  API_Interface._internal();
  //Singleton Class Declaration

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

  Future<String> addSearchHistory(String uid, String pid) async {
    //Variables
    query = 'query addhistory{' +
        'AddHistoryItem(input: "$uid", "$pid"){' +
        'successful' +
        '}';

    String temp = '';

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data;

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

  Future<String> removeSavedResult(String uid, String pid) async {
    //Variables
    query = 'query removesaved{' +
        'RemoveSavedResult(input: "$uid", "$pid"){' +
        'successful' +
        '}';

    String temp = '';

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data;

    //Return Statement
    return temp;
  }

  Future<String> addSavedResult(String uid, String pid) async {
    //Variables
    query = 'query addsaved{' +
        'AddSavedResult(input: "$uid", "$pid"){' +
        'successful' +
        '}';

    String temp = '';

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data;

    //Return Statement
    return temp;
  }

  getLocalUserID() {
    return '';
  }
}

final apiObj = API_Interface();

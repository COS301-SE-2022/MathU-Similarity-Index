//imports
import 'package:http/http.dart';
import 'dart:convert';
import 'package:client/UserData.dart';

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
  final Uri url = Uri.parse("http://127.0.0.1:5000/graphql");

  final Map<String, String> headerElements = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  String query = '';

  //Methods
  Future<List<dynamic>> getSearchResults(String qry) async {
    //Variables
    bool isLoggedIn = userData.getLogStatus();
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'query search{' +
        'Search(input: "$qry", "$isLoggedIn", "$uid", "$apke"){' +
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

  Future<List<dynamic>> getSearchHistory() async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'query gethistory{' +
        'GetUserHistory(input: "$uid", "$apke"){' +
        'id,latex}}';

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

    List<dynamic> equations = data['data']['GetUserHistory'];

    for (int i = 0; i < equations.length; i++) {
      temp.add(equations[i]);
    }

    //Return Statement
    return temp;
  }

  Future<bool> addSearchHistory(String pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'mutation addhistory{' +
        'AddUserSearchClick(input: "$pid", "$uid", "$apke")}';

    bool temp = false;

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data['data']['AddUserSearchClick'];

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getSavedResults() async {
    //Variables
    String uid = userData.getUserID();
    query = 'query saved{GetFavoriteProblems(input: "$uid"){id,latex}}';

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

    List<dynamic> equations = data['data']['GetFavoriteProblems'];

    for (int i = 0; i < equations.length; i++) {
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

  Future<bool> addSavedResult(String pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'mutation addsaved{AddFavorite(input:  "$pid", "$uid", "$apke")}';

    bool temp = false;

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data['data']['AddFavorite'];

    //Return Statement
    return temp;
  }

  Future<dynamic> addComment(String comment, String probid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'mutation addcomment{CreateComment(input: "$probid", "$uid", "$apke", "$comment"){success, msg, comment{problemid, datetiem, useremail, comment}}}';

    dynamic temp = false;

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data['data']['CreateComment'];

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getComments(String probid) async {
    //Variables
    query =
        'query getcomments{GetComments(input: "$probid"){problemid, datetiem, useremail, comment}}';

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

    List<dynamic> comments = data['data']['GetComments'];

    for (int i = 0; i < comments.length; i++) {
      temp.add(comments[i]);
    }

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getAllComments() async {
    //Variables
    query =
        'query getcomments{GetComments(){problemid, datetiem, useremail, comment}}';

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

    List<dynamic> comments = data['data']['GetComments'];

    for (int i = 0; i < comments.length; i++) {
      temp.add(comments[i]);
    }

    //Return Statement
    return temp;
  }

  Future<dynamic> userSignUp(String uid, String pass) async {
    //Variables
    query =
        'query userSignUp{UserSignUp(input: "$uid", "$pass"){success, msg, user{useremail, username, apikey, isadmin}}}';

    dynamic temp = '';

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data['data']['UserSignUp'];

    if (temp['success']) {
      userData.setUserID(temp['user']['useremail']);
      userData.setAPIKey(temp['user']['apikey']);
      userData.setAdmin(temp['user']['isadmin']);
      userData.setLoggedIn(true);
    }

    //Return Statement
    return temp;
  }

  Future<dynamic> authenticateLogin(String uid, String pass) async {
    //Variables
    query =
        'query login{AuthenticateLogin(input: "$uid", "$pass"){success, msg, user{useremail, username, apikey, isadmin}}}';

    dynamic temp = '';

    //Code
    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    dynamic data = jsonDecode(response.body);

    temp = data['data']['AuthenticateLogin'];

    if (temp['success']) {
      userData.setUserID(temp['user']['useremail']);
      userData.setAPIKey(temp['user']['apikey']);
      userData.setAdmin(temp['user']['isadmin']);
      userData.setLoggedIn(true);
    }

    //Return Statement
    return temp;
  }

  getLocalUserID() {
    return userData.getUserID();
  }
}

final apiObj = API_Interface();

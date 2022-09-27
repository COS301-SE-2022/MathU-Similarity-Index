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
  final Uri url = Uri.parse("https://mathuserver.azurewebsites.net/graphql");

  final Map<String, String> headerElements = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
    'Access-Control-Allow-Origin':
        'https://mathuserver.azurewebsites.net/graphql',
  };

  String query = '';

  //Methods
  Future<List<dynamic>> getAllEquations() async {
    query = 'query { GetAllEquations{id, latex} }';

    List<dynamic> temp = [];

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    List<dynamic> equations = data['data']['GetAllEquations'];

    if (equations != null && equations.isNotEmpty) {
      for (int i = 0; i < equations.length; i++) {
        temp.add(equations[i]);
      }
    }

    return temp;
  }

  Future<List<dynamic>> getMathPastPaperData() async {
    query =
        'query { GetMathPastPaperData{id, name, subject, paper, year, grade, month, curriculum, country, language} }';

    List<dynamic> temp = [];

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    List<dynamic> mathpastpaperdata = data['data']['GetMathPastPaperData'];

    if (mathpastpaperdata != null && mathpastpaperdata.isNotEmpty) {
      for (int i = 0; i < mathpastpaperdata.length; i++) {
        temp.add(mathpastpaperdata[i]);
      }
    }

    return temp;
  }

  Future<List<dynamic>> getMathsCalculations() async {
    query =
        'query { GetMathCalculationsData{calculationid, calculationname, inputfields} }';

    List<dynamic> temp = [];

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    List<dynamic> mathCalculationData = data['data']['GetMathCalculationsData'];

    if (mathCalculationData != null && mathCalculationData.isNotEmpty) {
      for (int i = 0; i < mathCalculationData.length; i++) {
        temp.add(mathCalculationData[i]);
      }
    }

    return temp;
  }

  Future<List<dynamic>> getSearchResults(String qry) async {
    //Variables
    bool isLoggedIn = userData.getLogStatus();
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'query search{' +
        'Search(input: "$qry", isloggedin: $isLoggedIn, useremail: "$uid", apikey: "$apke"){' +
        'numberofresults,equations{' +
        'equation{id,latex,tags{name}},similarity}}}';

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
        'GetUserHistory(useremail: "$uid", apikey: "$apke"){' +
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
        'AddUserSearchClick(problemid: "$pid", useremail: "$uid", apikey: "$apke")}';

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
    query = 'query saved{GetFavoriteProblems(useremail: "$uid"){id,latex}}';

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

  Future<bool> removeSavedResult(String uid, String pid) async {
    //Variables
    query = 'query removesaved{' +
        'RemoveSavedResult(input: "$uid", "$pid"){' +
        'successful' +
        '}';

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

  Future<bool> addSavedResult(String pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'mutation addsaved{AddFavorite(problemid:  "$pid", useremail: "$uid", apikey: "$apke")}';

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
        'mutation addcomment{CreateComment(problemid: "$probid", useremail: "$uid", apikey: "$apke", comment: "$comment"){success, msg, comment{problemid, datetime, useremail, comment}}}';

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
        'query getcomments{GetComments(problemid: "$probid"){comment, datetime{day,month,year,hour}}}';

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
        'query getcomments{GetComments(){problemid, datetime, useremail, comment}}';

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
        'query userSignUp{UserSignUp(useremail: "$uid", password: "$pass"){success, msg, user{useremail, username, apikey, isadmin}}}';

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
      List<dynamic> uH = await this.getSearchHistory();
      List<dynamic> sR = await this.getSavedResults();
      userData.setUserHistory(uH);
      userData.setSaved(sR);
      userData.setLoggedIn(true);
    }

    //Return Statement
    return temp;
  }

  Future<dynamic> authenticateLogin(String uid, String pass) async {
    //Variables
    query =
        'query login{AuthenticateLogin(useremail: "$uid", passwordsalt: "$pass"){success, msg, user{useremail, username, apikey, isadmin}}}';

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
      List<dynamic> uH = await this.getSearchHistory();
      List<dynamic> sR = await this.getSavedResults();
      userData.setUserHistory(uH);
      userData.setSaved(sR);
      userData.setLoggedIn(true);
    }

    //Return Statement
    return temp;
  }

  String getLocalUserID() {
    return userData.getUserID();
  }

  List<dynamic> getLocalUserHistory() {
    return userData.getLocalUserHistory();
  }

  List<dynamic> getLocalUserSaved() {
    return userData.getLocalSavedResults();
  }

  bool getIsLoggedIn() {
    return userData.getLogStatus();
  }

  bool getIsAdmin() {
    return userData.getAdminStatus();
  }

  void logOut() {
    userData.resetUserData();
  }
}

final apiObj = API_Interface();

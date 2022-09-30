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

Soon To Be Depracated Methods:
------------------------------
Search
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
  Future<String> getAPIStatus() async {
    String temp = '';

    query = 'query{APIStatus}';

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);
    temp = data['data']['APIStatus'];

    return temp;
  }

  Future<dynamic> getServerSettings() async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'query{GetServerSettings(useremail: "$uid", apikey: "$apke"){autocaching}}';

    dynamic temp;

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    temp = data['data']['GetServerSettings'];

    return temp;
  }

  Future<List<dynamic>> getAllTags() async {
    String uid =
        (userData.getUserID() == '') ? userData.getUserID() : 'default';
    String apke = userData.getAPIKey();

    query =
        'query{GetAllTags(useremail: "default", apikey: ""){success, msg, tags{id, name, description}}}';

    List<dynamic> temp = [];

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    if(response.statusCode == 200)
    {
      Map<dynamic, dynamic> data = jsonDecode(response.body);

      List<dynamic> tags = data['data']['GetAllTags']['tags'];

      if (tags != null && tags.isNotEmpty) {
        for (int i = 0; i < tags.length; i++) {
          temp.add(tags[i]);
        }
      }

      print('API Tags Return: $temp');

      return temp;
    }
    else{
      return [];
    }
    
  }

  Future<dynamic> getProblem(int pid) async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();

    query =
        'query{GetProblem(useremail: "$uid", apikey: "$apke", problemid: $pid){success, msg, equation{id, latex, mathml, tags, memolinks, favorite, issearch}}}';

    dynamic temp;

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    temp = data['data']['GetProblem']['equation'];

    return temp;
  }

  Future<bool> addEquation(String equation) async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();

    query =
        'query{AddEquation(useremail: "$uid", apikey: "$apke", equation: "$equation"){success, msg, equation{id, latex, mathml, tags, memolinks, favorite, issearch}}}';

    bool temp;

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    temp = data['data']['AddEquation']['success'];

    return temp;
  }

  Future<bool> setServerSettings(bool autoCache, String pw) async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();

    query =
        'query{SetServerSettings(useremail: "$uid", apikey: "$apke", password: "$pw", autocaching: $autoCache){success, msg}}';

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    bool temp = data['data']['SetServerSettings']['success'];

    return temp;
  }

  Future<bool> setTheme(bool darkMode) async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();

    query =
        'query{SetTheme(useremail: "$uid", apikey: "$apke", darktheme: $darkMode){success, msg}}';

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    Map<dynamic, dynamic> data = jsonDecode(response.body);

    bool temp = data['data']['SetTheme']['success'];

    return temp;
  }

  Future<List<dynamic>> getAllEquations() async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'query { GetAllEquations(useremail: "$uid",apikey: "$apke"){id, latex, mathml, tags, memolinks, favorite, issearch}}';

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
        'query { GetMathPastPaperData{id, name, subject, paper, year, grade, month, curriculum, country, language, downloadlink} }';

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

    if (equations != null && equations.isNotEmpty) {
      for (int i = 0; i < numberofresults; i++) {
        temp.add(equations[i]);
      }
    }

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getSimilaritySearch(
    String input,
    List<int> tags,
  ) async {
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();

    print('The SimilaritySearch API Return is: input: "$input", tags: $tags');

    query = 'query {' +
        'SimilaritySearch(useremail: "$uid", apikey: "$apke", input: "$input", tags: $tags){' +
        'success, msg, numberofresults, equations{equation{id, latex, tags{id, description, name}, mathml, memolinks, favorite, issearch}, similarity}}' +
        '}';

    List<dynamic> temp = [];

    Response response = await post(
      url,
      headers: headerElements,
      body: jsonEncode(<String, String>{
        'query': query,
      }),
    );

    if(response.statusCode == 200)
    {
      Map<dynamic, dynamic> data = jsonDecode(response.body);

      int numberofresults = data['data']['Search']['numberofresults'];

      List<dynamic> equations = data['data']['SimilaritySearch']['equations'];

      if (equations != null && equations.isNotEmpty) {
        for (int i = 0; i < numberofresults; i++) {
          temp.add(equations[i]);
        }
      }

      return temp;
    }
    else
    {
      return [];
    }

    
  }

  Future<List<dynamic>> getSearchHistory() async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'query gethistory{' +
        'GetUserHistory(useremail: "$uid", apikey: "$apke"){' +
        'id, latex, mathml, tags{id, description, name}, memolinks, favorite, issearch}}';

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

    if (equations != null && equations.isNotEmpty) {
      for (int i = 0; i < equations.length; i++) {
        temp.add(equations[i]);
      }
    }

    //Return Statement
    return temp;
  }

  Future<bool> addSearchHistory(int pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'mutation addhistory{' +
        'AddUserSearchClick(problemid: $pid, useremail: "$uid", apikey: "$apke"){success, msg}}';

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

    temp = data['data']['AddUserSearchClick']['success'];

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getSavedResults() async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'query saved{GetFavoriteProblems(useremail: "$uid", apikey: "$apke"){success, msg, equations{id, latex, tags{id, name, description}, mathml, memolinks, favorite, issearch}}';

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

    List<dynamic> equations = data['data']['GetFavoriteProblems']['equations'];

    if (equations != null && equations.isNotEmpty) {
      for (int i = 0; i < equations.length; i++) {
        temp.add(equations[i]);
      }
    }

    //Return Statement
    return temp;
  }

  Future<bool> removeSavedResult(int pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query = 'mutation removesaved{' +
        'RemoveFavorite(problemid: $pid, useremail: "$uid", apikey: "$apke"){' +
        'success, msg' +
        '}}';

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

    temp = data['data']['RemoveFavorite']['success'];

    //Return Statement
    return temp;
  }

  Future<bool> addSavedResult(int pid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'mutation addsaved{AddFavorite(problemid:  $pid, useremail: "$uid", apikey: "$apke"){success, msg, data}}';

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

    temp = data['data']['AddFavorite']['success'];

    //Return Statement
    return temp;
  }

  Future<dynamic> addComment(String comment, int probid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'mutation addcomment{CreateComment(problemid: $probid, useremail: "$uid", apikey: "$apke", comment: "$comment"){success, msg, comment{problemid, datetime{day,month,year,hour}, useremail, comment}}}';

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

  Future<List<dynamic>> getComments(int probid) async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'query getcomments{GetComments(useremail: "$uid",apikey: "$apke", problemid: $probid){comment, useremail, datetime{day,month,year,hour}}}';

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

    if (comments != null && comments.isNotEmpty) {
      for (int i = 0; i < comments.length; i++) {
        temp.add(comments[i]);
      }
    }

    //Return Statement
    return temp;
  }

  Future<List<dynamic>> getAllComments() async {
    //Variables
    String uid = userData.getUserID();
    String apke = userData.getAPIKey();
    query =
        'query getcomments{GetAllComments(useremail: "$uid", apikey: "$apke"){problemid, datetime{day,month,year,hour}, useremail, comment}}';

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

    if (comments != null && comments.isNotEmpty) {
      for (int i = 0; i < comments.length; i++) {
        temp.add(comments[i]);
      }
    }

    //Return Statement
    return temp;
  }

  Future<dynamic> userSignUp(String uid, String pass) async {
    //Variables
    String apke = userData.getAPIKey();
    query =
        'mutation userSignUp{UserSignUp(apikey: "$apke", useremail: "$uid", password: "$pass"){success, msg, user{useremail, username, apikey, isadmin}}}';

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
      /* List<dynamic> uH = await this.getSearchHistory();
      List<dynamic> sR = await this.getSavedResults();
      userData.setUserHistory(uH);
      userData.setSaved(sR); */
      userData.setLoggedIn(true);
    }

    //Return Statement
    return temp;
  }

  Future<dynamic> authenticateLogin(String uid, String pass) async {
    //Variables
    String apke = userData.getAPIKey();
    query =
        'query login{AuthenticateLogin(apikey: "$apke", useremail: "$uid", password: "$pass"){success, msg, user{useremail, username, apikey, isadmin, darktheme}}}';

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
      /* List<dynamic> uH = await this.getSearchHistory();
      List<dynamic> sR = await this.getSavedResults();
      userData.setUserHistory(uH);
      userData.setSaved(sR); */
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

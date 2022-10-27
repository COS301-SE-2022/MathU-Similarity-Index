//Imports
import 'dart:convert';

/*
NOTE
################################################################################
This singleton class will act as a global variable to access and store user data
################################################################################
*/

//Code
class UserData {
  static final UserData _userData = new UserData._internal();

  factory UserData() {
    return _userData;
  }

  UserData._internal();

  String _userID = 'default';
  String _apiKey =
      'Qx0m5eK38EHYNNwxcytbkpWR92KNTnrOQbBETydtHr2B57LrEyjnaksbeQXJ';
  bool _isLoggedIn = false;
  bool _isAdmin = false;
  List<dynamic> _userHistory = [];
  List<dynamic> _savedResults = [];
  String _settings = jsonEncode({
    'darkMode': false,
  });

  void setUserID(String uid) {
    _userID = uid;
  }

  void setAPIKey(String apke) {
    _apiKey = apke;
  }

  void setLoggedIn(bool b) {
    _isLoggedIn = b;
  }

  void setAdmin(bool b) {
    _isAdmin = b;
  }

  void setUserHistory(List<dynamic> uH) {
    if (uH.isNotEmpty) {
      for (int i = 0; i < uH.length; i++) {
        _userHistory.add(uH[i]);
      }
    }
  }

  void setSaved(List<dynamic> sR) {
    if (sR.isNotEmpty) {
      for (int i = 0; i < sR.length; i++) {
        _savedResults.add(sR[i]);
      }
    }
  }

  void resetUserData() {
    userData.setAPIKey("default");
    userData.setAdmin(false);
    userData.setLoggedIn(false);
    userData.setUserID("null@null.null");
    _userHistory = [];
    _savedResults = [];
  }

  String getUserID() {
    return _userID;
  }

  String getAPIKey() {
    return _apiKey;
  }

  bool getLogStatus() {
    return _isLoggedIn;
  }

  bool getAdminStatus() {
    return _isAdmin;
  }

  List<dynamic> getLocalUserHistory() {
    return _userHistory;
  }

  List<dynamic> getLocalSavedResults() {
    return _savedResults;
  }
}

final userData = UserData();

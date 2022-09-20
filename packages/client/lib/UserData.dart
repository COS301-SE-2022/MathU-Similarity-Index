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

  String _userID = 'test@email.com';
  String _apiKey = 'default';
  bool _isLoggedIn = true;
  bool _isAdmin = true;
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
}

final userData = UserData();

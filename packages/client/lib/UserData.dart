//Imports

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

  String _userID = '';

  void setUserID(String uid) {
    _userID = uid;
  }

  getUserID() {
    return _userData;
  }
}

final userData = UserData();

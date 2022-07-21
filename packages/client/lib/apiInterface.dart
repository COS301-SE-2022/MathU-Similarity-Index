//imports

/*
Note:
################################################################################
This class will be used to define all methods used to make API calls. An object
of this class should be instatiated in whichever file wishes to make an API
call. This is done to adhere to DRY coding standards
################################################################################
*/

//Code
class API_Inteface {
  //Common Variables
  Uri url = Uri.parse("http://127.0.0.1:5000/graphql");

  Map<String, String> headerElements = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json',
  };

  String query = '';

  //API Method Calls

}

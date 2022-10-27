//Imports
import 'package:flutter/material.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/apiInterface.dart';
import 'package:email_validator/email_validator.dart';

/*
NOTE
################################################################################
This page allows the user to log in to their accounts or allow them to go to
the sign up page.
################################################################################
*/

//Code
class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String email = '';
  String password = '';
  bool showPassword = false;

  bool incorrectPassword = false;
  bool invalidEmail = false;
  bool noAccount = false;

  bool isLoggedIn = apiObj.getIsLoggedIn();

  /*TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const TitleBar(),
      endDrawer: const NavigationDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Color(0xff003154),
              Color(0xfffd1f63),
              //Color(0xff003154),
            ], // Gradient from https://learnui.design/tools/gradient-generator.html
            tileMode: TileMode.mirror,
          ),
          image: DecorationImage(
            image: AssetImage('assets/images/LogIn.png'),
            fit: BoxFit.fitHeight,
            alignment: Alignment.bottomLeft,
          ),
        ),
        child: Center(
          child: (isLoggedIn)
              ? SizedBox(
                  width: 800,
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        "You are logged in!",
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.15,
                          wordSpacing: 1.05,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  width: 800,
                  height: 400,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Log In",
                            style: TextStyle(
                              fontSize: 18,
                              letterSpacing: 0.15,
                              wordSpacing: 1.05,
                            ),
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Email Address:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.15,
                                    wordSpacing: 1.05,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  //controller: emailController,
                                  onChanged: emailHandler,
                                  decoration: InputDecoration(
                                    /* floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    label: (invalidEmail && noAccount)
                                        ? Text(
                                            'It seems like you do not have an account')
                                        : (!invalidEmail)
                                            ? Text(
                                                'This is not an email address...')
                                            : null, */
                                    hintText: "johnDoe@email.com",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Password:",
                                  style: TextStyle(
                                    fontSize: 16,
                                    letterSpacing: 0.15,
                                    wordSpacing: 1.05,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  obscureText: !showPassword,
                                  onChanged: passwordHandler,
                                  decoration: InputDecoration(
                                    /* floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    label: (incorrectPassword)
                                        ? Text('Passwords Do Not Match')
                                        : null, */
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showPassword = !showPassword;
                                        });
                                      },
                                      icon: Icon((showPassword)
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  onPressed: logIn,
                                  child: Text(
                                    "Launch",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    elevation: MaterialStateProperty
                                        .resolveWith<double>(((states) => 0)),
                                    backgroundColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                  ),
                                ),
                              ),
                              SizedBox(width: 25),
                              Expanded(
                                flex: 3,
                                child: TextButton(
                                  onPressed: goToSignUpPage,
                                  child: Text(
                                      "Don't have an account? Let's Sign Up!"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void emailHandler(val) {
    setState(() {
      email = val;
    });
  }

  void passwordHandler(val) {
    setState(() {
      password = val;
    });
  }

  void logIn() async {
    setState(() {
      invalidEmail = EmailValidator.validate(email);
    });

    if (invalidEmail) {
      dynamic temp = await apiObj.authenticateLogin(email, password);

      if (temp != null) {
        if (temp['success'] != null && temp['success']) {
          setState(() {
            isLoggedIn = apiObj.getIsLoggedIn();

            String msg = temp['msg'];

            if (msg == "Bad email") {
              noAccount = true;
            } else if (msg == "Bad password") {
              incorrectPassword = true;
            }
          });
        }
      }
    }
  }

  void goToSignUpPage() {
    Navigator.popAndPushNamed(context, '/sign_up.dart');
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Color.fromRGBO(236, 64, 122, 1);
    }
    return Color.fromRGBO(236, 64, 122, 1);
  }
}

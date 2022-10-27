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
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email = '';
  String password = '';
  String confirmPassword = '';
  bool showPassword = false;
  bool showConfirmPassword = false;

  bool incorrectPassword = false;
  bool correctConfirmPassword = false;
  bool validEmail = false;
  bool noAccount = false;

  bool isLoggedIn = apiObj.getIsLoggedIn();

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
            image: AssetImage('assets/images/SignUp.png'),
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
                        "You are Signed Up & logged in!",
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
                  height: 500,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 15, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Sign Up",
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
                                    label: (validEmail && noAccount)
                                        ? Text('This email address is taken')
                                        : (!validEmail)
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
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Confirm Password:",
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
                                  obscureText: !showConfirmPassword,
                                  onChanged: confirmPasswordHandler,
                                  decoration: InputDecoration(
                                    /* floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    floatingLabelAlignment:
                                        FloatingLabelAlignment.start,
                                    label: (!correctConfirmPassword)
                                        ? Text('Passwords Do Not Match')
                                        : null, */
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          showConfirmPassword =
                                              !showConfirmPassword;
                                        });
                                      },
                                      icon: Icon((showConfirmPassword)
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
                              ElevatedButton(
                                onPressed: signUp,
                                child: Text(
                                  "Launch",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ButtonStyle(
                                  elevation:
                                      MaterialStateProperty.resolveWith<double>(
                                          ((states) => 0)),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith(
                                          getColor),
                                ),
                              ),
                              SizedBox(width: 10),
                              TextButton(
                                onPressed: goToLogInPage,
                                child: Text(
                                    "Already have an account? Let's Log In!"),
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

  void confirmPasswordHandler(val) {
    setState(() {
      confirmPassword = val;
    });
  }

  void goToLogInPage() {
    Navigator.popAndPushNamed(context, '/logIn.dart');
  }

  void signUp() async {
    setState(() {
      validEmail = EmailValidator.validate(email);
      correctConfirmPassword = (confirmPassword == password) ? true : false;
    });

    if (validEmail && correctConfirmPassword) {
      dynamic temp = await apiObj.userSignUp(email, password);

      if (temp != null) {
        if (temp['success'] != null && temp['success']) {
          setState(() {
            isLoggedIn = apiObj.getIsLoggedIn();

            String msg = temp['success'];

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

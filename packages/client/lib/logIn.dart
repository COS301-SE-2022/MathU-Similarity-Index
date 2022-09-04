//Imports
import 'package:flutter/material.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/apiInterface.dart';

/*
NOTE
################################################################################
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Container(
        margin: EdgeInsets.fromLTRB(100, 20, 100, 20),
        child: Center(
          child: Container(
            padding: EdgeInsets.all(100),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email:", textAlign: TextAlign.left),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "johndoe@email.com",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    onChanged: emailHandler,
                  ),
                  SizedBox(height: 20),
                  Text("Password:", textAlign: TextAlign.left),
                  TextFormField(
                    obscureText: true,
                    onChanged: passwordHandler,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink[400]),
                    ),
                    onPressed: logIn,
                    child: Text(
                      "Launch",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
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

  void logIn() {
    print(email + "    " + password);
  }
}

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
      appBar: const TitleBar(),
      endDrawer: const NavigationDrawer(),
      body: Container(
        margin: const EdgeInsets.fromLTRB(100, 20, 100, 20),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(100),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Email:", textAlign: TextAlign.left),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "johndoe@email.com",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                    ),
                    onChanged: emailHandler,
                  ),
                  const SizedBox(height: 20),
                  const Text("Password:", textAlign: TextAlign.left),
                  TextFormField(
                    obscureText: true,
                    onChanged: passwordHandler,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink[400]),
                    ),
                    onPressed: logIn,
                    child: const Text(
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

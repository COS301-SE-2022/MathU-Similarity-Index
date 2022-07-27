//Imports
import 'package:flutter/material.dart';
import 'package:client/home.dart';
import 'package:client/calculations.dart';
import 'package:client/pastpapers.dart';
import 'package:client/savedResults.dart';
import 'package:client/history.dart';
import 'package:client/login_page.dart';
import 'package:client/logIn.dart';

/*
NOTE:
######################################################################
The only thing to be added to this file is the routes used for getting
from page to page.
######################################################################
*/

//Code
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
    routes: {
      '/home.dart': (context) => Home(),
      '/pastpapers.dart': (context) => const PastPapers(),
      '/calculations.dart': (context) => const MathematicalTools(),
      '/savedResults.dart': (context) => const SavedResults(),
      '/history.dart': ((context) => const History()),
      '/login_page.dart': ((context) => const LoginPage()),
      '/logIn.dart': ((context) => const LogIn()),
    },
  ));
}

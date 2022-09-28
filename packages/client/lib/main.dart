//Imports
import 'package:client/PDFQuestions.dart';
import 'package:flutter/material.dart';
import 'package:client/home.dart';
import 'package:client/PastPapersTools.dart';
import 'package:client/savedResults.dart';
import 'package:client/history.dart';
import 'package:client/logIn.dart';
import 'package:client/sign_up.dart';
import 'package:client/admin_page.dart';
import 'package:client/Mathematical Tools/MathematicalTools.dart';
//import 'package:client/equationOverview.dart';

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
      '/PastPapersTools.dart': (context) => const PastPaperTools(),
      '/MathematicalTools.dart': (context) => const MathematicalTools(),
      '/savedResults.dart': (context) => const SavedResults(),
      '/history.dart': ((context) => const History()),
      '/logIn.dart': ((context) => const LogIn()),
      '/sign_up.dart': (((context) => const SignUpPage())),
      '/admin_page.dart': (((context) => const AdminPage())),
      //'/equationOverview.dart': ((context) =>
      //const EquationOverview(equation: '', conf_score: '', problemID: '')),
    },
    theme: ThemeData(fontFamily: 'MathU'),
  ));
}

//Imports
import 'package:flutter/material.dart';
import 'package:client/home.dart';

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
    home: Home(),
    routes: {
      '/home.dart': (context) => Home(),
    },
  ));
}

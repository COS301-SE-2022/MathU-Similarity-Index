//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:flutter_tex/flutter_tex.dart';

/*
NOTE:
######################################################################
This file will be used to create the home page which will serve as the
point where users will type in their search queries
######################################################################
*/

//Code
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variable Declarations
  String qry = '';
  //Variable Declarations

  //Math Keyboard
  final MathFieldEditingController textController =
      MathFieldEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
  //Math Keyboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathU Similarity Index', textAlign: TextAlign.center),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          height: 50,
          child: MathField(
            variables: const ['a', 'b', 'c', 'x', 'y', 'z'],
            keyboardType: MathKeyboardType.expression,
            decoration: InputDecoration(
              hintText: 'x + 3 = 5',
              border: OutlineInputBorder(),
            ),
            controller: textController,
            onChanged: (value) {
              try {
                qry = '${TeXParser(value).parse()}';
              } catch (_) {
                qry = 'invalid input';
              }
            },
          ),
        ),
      ),
    );
  }
}

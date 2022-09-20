//Imports
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'bottomscreen.dart';
import 'topscreen.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class CalculatorScreen extends StatefulWidget {
  final String answer;
  final String question;
  const CalculatorScreen(
      {Key? key, required this.answer, required this.question})
      : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_1 = Color(0xFF0476c7);

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Flexible(
          fit: FlexFit.loose,
          flex: 5,
          child: Container(
              height: 3000,
              decoration: const BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Flexible(
                      fit: FlexFit.loose,
                      child: TopScreen(
                        Question: widget.question,
                      )),
                  Flexible(fit: FlexFit.loose, child: Container()),
                  Flexible(
                      fit: FlexFit.loose,
                      child: BottomScreen(Answer: widget.answer)),
                ],
              )))
    ]);
  }
}

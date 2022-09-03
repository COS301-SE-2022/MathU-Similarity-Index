//Imports
// ignore_for_file: constant_identifier_names

import 'package:client/Mathematical%20Tools/Calculator/topscreen.dart';
import 'package:flutter/material.dart';

import 'bottomscreen.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_1 = Color(0xFF0476c7);

class _CalculatorScreenState extends State<CalculatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
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
                const Flexible(child: TopScreen()),
                Flexible(child: Container()),
                const Flexible(child: BottomScreen()),
              ],
            )));
  }
}

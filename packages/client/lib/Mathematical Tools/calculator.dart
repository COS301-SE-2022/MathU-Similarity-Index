// ignore_for_file: constant_identifier_names, prefer_const_constructors
import 'package:client/Mathematical%20Tools/Calculator/calculatorscreen.dart';
import 'package:client/Mathematical%20Tools/Calculator/calculatortype.dart';
import 'package:client/Mathematical%20Tools/Calculator/numberkeys.dart';
import 'package:client/Mathematical%20Tools/InputField_Mathematical_Tools/InputField.dart';
import 'package:client/titlebar.dart';
import 'package:flutter/material.dart';
import '../NavigationDrawer.dart';
import 'Calculator/functionkeys.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

const Color Calculator_background = Color(0xFF345b82);
const appcolour = const Color(0xFF003255);

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TitleBar(),
        endDrawer: NavigationDrawer(),
        body: Row(children: [
          Flexible(
            flex: 5,
            child: InputField(
                Calculation_type: "Tawanda Jimu Samaita",
                Inputtypes: const ["kkkk", "fish"]),
          ),
          Flexible(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.fromLTRB(100.0, 20.0, 110.0, 40.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(36),
                      topRight: Radius.circular(36),
                      bottomLeft: Radius.circular(36),
                      bottomRight: Radius.circular(36)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    CalculatorScreen(),
                    Flexible(
                        flex: 6,
                        child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2.0),
                            child: Column(children: const <Widget>[
                              CalculatorType(),
                              Divider(color: Colors.grey),
                              Functionkeys(),
                              NumberKeys(),
                            ])))
                  ],
                ),
              ))
        ]));
  }
}

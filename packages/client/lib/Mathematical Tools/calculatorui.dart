// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'Calculator/calculatortype.dart';
import 'Calculator/functionkeys.dart';
import 'Calculator/numberkeys.dart';

import 'Calculator/calculatorscreen.dart';

class calculatorui extends StatefulWidget {
  final String Answer;
  final String Question;
  const calculatorui({Key? key, required this.Answer, required this.Question})
      : super(key: key);

  @override
  State<calculatorui> createState() => _calculatoruiState();
}

class _calculatoruiState extends State<calculatorui> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        fit: FlexFit.loose,
        flex: 3,
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          width: 280,
          alignment: Alignment.centerRight,
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
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 5,
                  child: CalculatorScreen(
                    answer: widget.Answer,
                    question: widget.Question,
                  )),
              Flexible(
                  fit: FlexFit.loose,
                  flex: 6,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2.0),
                      child: Column(children: const <Widget>[
                        Flexible(
                            fit: FlexFit.loose,
                            flex: 1,
                            child: CalculatorType()),
                        Flexible(
                            fit: FlexFit.loose,
                            flex: 1,
                            child: Divider(color: Colors.grey)),
                        Flexible(
                            fit: FlexFit.loose, flex: 9, child: Functionkeys()),
                        Flexible(
                            fit: FlexFit.loose, flex: 10, child: NumberKeys()),
                      ])))
            ],
          ),
        ));
  }
}

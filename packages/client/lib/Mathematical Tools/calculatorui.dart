// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'Calculator/calculatortype.dart';
import 'Calculator/functionkeys.dart';
import 'Calculator/numberkeys.dart';

class calculatorui extends StatefulWidget {
  const calculatorui({Key? key}) : super(key: key);

  @override
  State<calculatorui> createState() => _calculatoruiState();
}

class _calculatoruiState extends State<calculatorui> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 2.0),
        child: Column(children: const <Widget>[
          Flexible(fit: FlexFit.loose, flex: 1, child: CalculatorType()),
          Flexible(
              fit: FlexFit.loose, flex: 1, child: Divider(color: Colors.grey)),
          Flexible(fit: FlexFit.loose, flex: 9, child: Functionkeys()),
          Flexible(fit: FlexFit.loose, flex: 10, child: NumberKeys()),
        ]));
  }
}

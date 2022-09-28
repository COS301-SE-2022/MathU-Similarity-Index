// ignore_for_file: non_constant_identifier_names, constant_identifier_names, file_names

import 'package:flutter/material.dart';
import 'InputFieldheading.dart';
import 'TextField_3.dart';
import 'TextFields_2.dart';
import 'TextFields_1.dart';
/*
NOTE
################################################################################
################################################################################
*/

//Code
class InputField extends StatefulWidget {
  InputField(
      {Key? key,
      required this.Calculation_type,
      required this.Inputtypes,
      required this.calculation_id})
      : super(key: key);
  final String Calculation_type;
  final int calculation_id;
  var Inputtypes;

  @override
  State<InputField> createState() => _InputFieldState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _InputFieldState extends State<InputField> {
  late TextFields_1 One_TextField = TextFields_1(
      Inputtypes: widget.Inputtypes, calculation_id: widget.calculation_id);
  late TextFields_2 Two_TextField = TextFields_2(
      Inputtypes: widget.Inputtypes, calculation_id: widget.calculation_id);
  late TextFields_3 Three_TextField = TextFields_3(
      Inputtypes: widget.Inputtypes, calculation_id: widget.calculation_id);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12.0, 50.0, 0, 0),
      child: Column(
        children: <Widget>[
          Flexible(
              fit: FlexFit.loose,
              flex: 8,
              child:
                  InputFieldHeading(Calculation_type: widget.Calculation_type)),
          Flexible(
              fit: FlexFit.loose,
              flex: 1,
              child: Column(children: const <Widget>[
                Flexible(
                  child: Divider(
                    color: Calculator_background,
                    thickness: 3,
                  ),
                )
              ])),
          Flexible(
              fit: FlexFit.loose,
              flex: 18,
              child: Column(children: <Widget>[
                if (widget.Inputtypes.length == 1)
                  One_TextField
                else if (widget.Inputtypes.length == 2)
                  Two_TextField
                else if (widget.Inputtypes.length == 3)
                  Three_TextField,
              ]))
        ],
      ),
    );
  }
}

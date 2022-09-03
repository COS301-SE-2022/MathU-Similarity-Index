//Imports
// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:new_ui/InputField_mathematicaltools/InputFieldheading.dart';
import 'package:new_ui/InputField_mathematicaltools/TextField_3.dart';
import 'package:new_ui/InputField_mathematicaltools/TextFields_1.dart';
import 'package:new_ui/InputField_mathematicaltools/TextFields_2.dart';

import 'Buttons.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class InputField extends StatefulWidget {
  const InputField(
      {Key? key, required this.Calculation_type, required this.Inputtypes})
      : super(key: key);
  final String Calculation_type;
  final List<String> Inputtypes;

  @override
  State<InputField> createState() => _InputFieldState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _InputFieldState extends State<InputField> {
  late TextFields_1 One_TextField = TextFields_1(Inputtypes: widget.Inputtypes);
  late TextFields_2 Two_TextField =
      new TextFields_2(Inputtypes: widget.Inputtypes);
  late TextFields_3 Three_TextField =
      new TextFields_3(Inputtypes: widget.Inputtypes);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12.0, 50.0, 0, 0),
      child: Column(
        children: <Widget>[
          Flexible(
              flex: 1,
              child:
                  InputFieldHeading(Calculation_type: widget.Calculation_type)),
          Flexible(
              //DIVIDER
              flex: 1,
              child: Column(children: const <Widget>[
                Divider(
                  color: Calculator_background,
                  thickness: 3,
                ),
              ])),
          Flexible(
              flex: 16,
              child: Column(children: <Widget>[
                if (widget.Inputtypes.length == 1)
                  One_TextField
                else if (widget.Inputtypes.length == 2)
                  Two_TextField
                else if (widget.Inputtypes.length == 3)
                  Three_TextField,
                if (widget.Inputtypes.length == 1)
                  One_TextField
                else if (widget.Inputtypes.length == 2)
                  Two_TextField
                else if (widget.Inputtypes.length == 3)
                  const InputFieldButtons(),
              ]))
        ],
      ),
    );
  }
}

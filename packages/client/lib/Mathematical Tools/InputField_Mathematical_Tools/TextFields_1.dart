//Imports
// ignore_for_file: camel_case_types, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TextFields_1 extends StatefulWidget {
  final List<String> Inputtypes;
  const TextFields_1({Key? key, required this.Inputtypes}) : super(key: key);

  @override
  State<TextFields_1> createState() => _TextFields_1State();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _TextFields_1State extends State<TextFields_1> {
  late String textinput;
  final MathFieldEditingController textController =
      MathFieldEditingController();

  List<String> returninput() {
    return [textinput];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: MathField(
            // No parameters are required.

            keyboardType: MathKeyboardType.expression,
            variables: const ['x', 'y', 'z', '='],
            decoration: InputDecoration(
              // hintText: "${widget.Inputtypes[0]} *",
              labelText: widget.Inputtypes[0],
              labelStyle: const TextStyle(
                color: Calculator_background,
              ),
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Calculator_background)),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Calculator_background)),
            ),
            controller: textController,
            onSubmitted: (value) {
              textinput = value;
            },
          ),
        ),
      ],
    );
  }
}

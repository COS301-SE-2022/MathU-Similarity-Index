//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TextFields_2 extends StatefulWidget {
  final List<String> Inputtypes;
  const TextFields_2({Key? key, required this.Inputtypes}) : super(key: key);

  @override
  State<TextFields_2> createState() => _TextFields_2State();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _TextFields_2State extends State<TextFields_2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: MathField(
            // No parameters are required.

            keyboardType: MathKeyboardType.expression,
            variables: const ['x', 'y', 'z', '='],
            decoration: InputDecoration(
              hintText: "${widget.Inputtypes[0]} *",
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: MathField(
            // No parameters are required.

            keyboardType: MathKeyboardType.expression,
            variables: const ['x', 'y', 'z', '='],
            decoration: InputDecoration(
              hintText: "${widget.Inputtypes[1]} *",
              labelText: widget.Inputtypes[1],
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
          ),
        ),
      ],
    );
  }
}

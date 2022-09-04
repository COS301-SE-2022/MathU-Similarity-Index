//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TextFields_3 extends StatefulWidget {
  final List<String> Inputtypes;
  const TextFields_3({Key? key, required this.Inputtypes}) : super(key: key);

  @override
  State<TextFields_3> createState() => _TextFields_3State();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _TextFields_3State extends State<TextFields_3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Calculator_background)),
              hintText: "${widget.Inputtypes[0]} *",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Calculator_background)),
              hintText: "${widget.Inputtypes[1]} *",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: Calculator_background)),
              hintText: "${widget.Inputtypes[2]} *",
            ),
          ),
        ),
      ],
    );
  }
}

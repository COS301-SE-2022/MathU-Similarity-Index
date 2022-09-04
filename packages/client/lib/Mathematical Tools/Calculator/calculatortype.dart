//Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class CalculatorType extends StatefulWidget {
  const CalculatorType({Key? key}) : super(key: key);

  @override
  State<CalculatorType> createState() => _CalculatorTypeState();
}

class _CalculatorTypeState extends State<CalculatorType> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
        flex: 1,
        child: Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(decoration: TextDecoration.none),
              children: <TextSpan>[
                TextSpan(
                  text: 'Scientific   ',
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink,
                  ),
                ),
                TextSpan(
                  text: 'Normal',
                  style: GoogleFonts.raleway(
                    fontSize: 12,
                    color: Colors.pink,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

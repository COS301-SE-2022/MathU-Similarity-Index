//Imports
// ignore_for_file: file_names, non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class InputFieldHeading extends StatefulWidget {
  final String Calculation_type;
  const InputFieldHeading({Key? key, required this.Calculation_type})
      : super(key: key);

  @override
  State<InputFieldHeading> createState() => _InputFieldHeadingState();
}

const Color Calculator_background = Color(0xFF1D3557);
const Color Calculator_background_pink = Color(0xFFE63946);

class _InputFieldHeadingState extends State<InputFieldHeading> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Flexible(
          fit: FlexFit.loose,
          flex: 3,
          child: Align(
              alignment: Alignment.topLeft,
              child: Column(children: <Widget>[
                Flexible(
                    child: RichText(
                  text: TextSpan(
                    style: const TextStyle(decoration: TextDecoration.none),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Math',
                        style: GoogleFonts.nunito(
                          // style: GoogleFonts.c(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Calculator_background,
                        ),
                      ),
                      TextSpan(
                        text: 'U',
                        style: GoogleFonts.nunito(
                          // style: GoogleFonts.c(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Calculator_background_pink,
                        ),
                      ),
                      TextSpan(
                        text: 'Emporium\n',
                        style: GoogleFonts.nunito(
                          // style: GoogleFonts.c(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Calculator_background,
                        ),
                      ),
                      TextSpan(
                        text: widget.Calculation_type,
                        style: GoogleFonts.nunito(
                          // style: GoogleFonts.c(
                          fontSize: 42,
                          fontWeight: FontWeight.w800,
                          color: Calculator_background,
                        ),
                      ),
                    ],
                  ),
                )),
                const SizedBox(
                  height: 20,
                )
              ])))
    ]);
  }
}

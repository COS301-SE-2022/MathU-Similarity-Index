//Imports
// ignore_for_file: non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class BottomScreen extends StatefulWidget {
  String Answer;
  BottomScreen({
    Key? key,
    required this.Answer,
  }) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  callBack(var Answer) {
    setState(() {
      widget.Answer = Answer;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0.0, 0.0, 12, 25),
        child: Align(
          alignment: Alignment.bottomRight,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(decoration: TextDecoration.none),
              children: <TextSpan>[
                TextSpan(
                  text: widget.Answer,
                  style: GoogleFonts.raleway(
                    fontSize: 42,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

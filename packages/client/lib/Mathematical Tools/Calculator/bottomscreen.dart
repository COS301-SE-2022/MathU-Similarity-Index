//Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
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
                  text: 'Answer',
                  style: GoogleFonts.raleway(
                    fontSize: 22,
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

//Imports
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TopScreen extends StatefulWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  State<TopScreen> createState() => _TopScreenState();
}

class _TopScreenState extends State<TopScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(12.0, 25.0, 0, 0),
        child: Align(
          alignment: Alignment.topLeft,
          child: RichText(
            text: TextSpan(
              style: const TextStyle(decoration: TextDecoration.none),
              children: <TextSpan>[
                TextSpan(
                  text: 'Question',
                  style: GoogleFonts.raleway(
                    fontSize: 22,
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

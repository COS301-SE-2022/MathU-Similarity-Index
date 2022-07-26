//Imports
import 'package:flutter/material.dart';

/*
NOTE
################################################################################
This widget is used to display a helpful message indicating whether search 
results returned successfully
################################################################################
*/

//Code
class NothingToSeeHere extends StatelessWidget {
  const NothingToSeeHere({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'There is nothing to see here...',
        style: TextStyle(
          color: Colors.grey[700],
          letterSpacing: 1.1,
          wordSpacing: 2.0,
        ),
      ),
    );
  }
}

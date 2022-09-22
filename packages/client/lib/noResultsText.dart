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
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.bottomCenter,
          image: AssetImage('images/404.png'),
          fit: BoxFit.scaleDown,
        ),
      ),
      child: Text(
        'There is nothing to see here...',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.grey[700],
          letterSpacing: 1.1,
          wordSpacing: 2.0,
        ),
      ),
    );
  }
}

//Imports
import 'package:flutter/material.dart';

/*
NOTE
################################################################################
################################################################################
*/

//Code
class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'MathU Similarity Index',
        style: TextStyle(
          fontSize: 36.0,
        ),
      ),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Color(0xFF003255),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(66);
}

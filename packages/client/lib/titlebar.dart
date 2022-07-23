import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget implements PreferredSizeWidget {
  const TitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MathU Similarity Index'),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Color(0xFF003255),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

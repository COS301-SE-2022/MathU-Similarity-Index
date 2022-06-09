import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MathU Similarity Index'),
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 34, 17, 129),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

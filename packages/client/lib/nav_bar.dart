import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MathU Similarity Index'),
      centerTitle: true,
      backgroundColor: Color(0xff002E50),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

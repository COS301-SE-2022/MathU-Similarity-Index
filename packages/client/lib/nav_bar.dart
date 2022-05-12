import 'dart:html';

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MathU Similarity Index'),
      centerTitle: true,
      backgroundColor: Colors.amber[400],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

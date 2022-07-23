import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('MathU Similarity Index'),
      centerTitle: true,
      backgroundColor: const Color(0xff002E50),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

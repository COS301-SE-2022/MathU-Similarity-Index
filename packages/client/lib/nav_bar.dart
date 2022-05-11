import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MathU Similarity Index'),
        centerTitle: true,
        backgroundColor: Colors.amber[400],
      ),
    );
  }
}

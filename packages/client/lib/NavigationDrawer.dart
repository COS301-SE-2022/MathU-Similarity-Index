//Imports
import 'package:flutter/material.dart';
/*
NOTE:
################################################################################
################################################################################
*/

//Code
class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF003255),
      elevation: 1.0,
      child: ListView(
        children: [
          Text(
            'Link 1',
            style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          Text(
            'Link 2',
            style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          Text(
            'Link 3',
            style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

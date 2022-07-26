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
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToPage(1),
            title: Text(
              'History',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.history,
              color: Colors.grey[200],
            ),
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToPage(2),
            title: Text(
              'Saved',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.bookmark,
              color: Colors.grey[200],
            ),
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToPage(3),
            title: Text(
              'Chapters',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.book,
              color: Colors.grey[200],
            ),
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToPage(4),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.settings,
              color: Colors.grey[200],
            ),
          ),
          Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
        ],
      ),
    );
  }

  //Methods
  goToPage(int pageNumber) {
    switch (pageNumber) {
      case 1:
        print("Go To History");
        break;
      case 2:
        print("Go To Saved");
        break;
      case 3:
        print("Go To Chapters");
        break;
      case 4:
        print("Go To Settings");
        break;
      default:
        print("Here");
        break;
    }
  }
}
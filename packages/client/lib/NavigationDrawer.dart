import 'package:client/calculations.dart';
import 'package:client/pastpapers.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF003255),
      elevation: 1.0,
      child: ListView(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToHomePage,
            title: Text(
              'Home',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.home,
              color: Colors.grey[200],
            ),
          ),
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToHistoryPage,
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
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToSavedPage,
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
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToPastPapersPage,
            title: Text(
              'Past Papers',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.archive,
              color: Colors.grey[200],
            ),
          ),
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToMathToolsPage,
            title: Text(
              'Mathematical Tools',
              style: TextStyle(color: Colors.grey[200], fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[200],
            ),
            leading: Icon(
              Icons.calculate,
              color: Colors.grey[200],
            ),
          ),
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            mouseCursor: SystemMouseCursors.click,
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToChaptersPage,
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
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
          ListTile(
            contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            onTap: goToSettingsPage,
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
          const Divider(
            height: 5.0,
            color: Color(0xFFA23B80),
          ),
        ],
      ),
    );
  }

  //Methods
  goToHomePage() {
    Navigator.pushNamed(context, '/home.dart');
  }

  goToHistoryPage() {
    Navigator.pushNamed(context, '/history.dart');
  }

  goToSavedPage() {
    Navigator.pushNamed(context, '/savedResults.dart');
  }

  goToChaptersPage() {}

  goToSettingsPage() {}

  goToMathToolsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MathematicalTools()),
    );
  }

  goToPastPapersPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PastPapers()),
    );
  }
}

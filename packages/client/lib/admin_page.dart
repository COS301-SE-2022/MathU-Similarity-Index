//IMPORTS
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';

/*
NOTE
################################################################################
This page allows admins to create new problems, delete users, and comments,
and other admin related issues.
################################################################################
*/

//CODE
class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Container(
        child: Center(
          child: IconButton(
            onPressed: () async {
              List<dynamic> temp = await apiObj.getAllEquations();
              print(temp);
            },
            icon: Icon(Icons.code),
          ),
        ),
      ),
    );
  }
}

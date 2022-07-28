//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';

/*
NOTE
################################################################################
This will serve as the final destination for the user's journey for an equation.
This page will show all comments related to an equation, and provide a means for
the user to add to the comments.
################################################################################
*/

//Code
class EquationOverview extends StatefulWidget {
  const EquationOverview({Key? key}) : super(key: key);

  @override
  State<EquationOverview> createState() => _EquationOverviewState();
}

class _EquationOverviewState extends State<EquationOverview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 5.0),
            child: ListTile(),
          ),
        ],
      ),
    );
  }
}

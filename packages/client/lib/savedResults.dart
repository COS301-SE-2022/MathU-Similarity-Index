//Imports
import 'package:flutter/material.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/savedResultItem.dart';
import 'package:client/noResultsText.dart';
import 'package:client/apiInterface.dart';

/*
NOTE
################################################################################
This will serve as the page where the user can view all of their saved
equations.
################################################################################
*/

//Code
class SavedResults extends StatefulWidget {
  const SavedResults({Key? key}) : super(key: key);

  @override
  State<SavedResults> createState() => _SavedResultsState();
}

class _SavedResultsState extends State<SavedResults> {
  String uid = '';
  bool isSet = false;
  API_Interface apiObj = new API_Interface();
  List<dynamic> savedResults = [];

  void loadItems() async {
    savedResults = await apiObj.getSavedResults(uid);

    setState(() {
      if (savedResults.isNotEmpty) {
        isSet = true;
      } else {
        isSet = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    loadItems();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
            child: Text(
              'Saved',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.grey[700],
              ),
            ),
          ),
          (isSet)
              ? Expanded(
                  child: ListView.builder(
                      key: Key("TestListViewBuilder"),
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: savedResults.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return SavedResultItem(
                            equation: savedResults[index]['equation']['latex'],
                            conf_score:
                                savedResults[index]['similarity'].toString());
                      }),
                )
              : NothingToSeeHere(),
        ],
      ),
    );
  }
}

//Imports
import 'package:flutter/material.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/noResultsText.dart';
import 'package:client/apiInterface.dart';

/*
NOTE
################################################################################
This will serve as the page where the user can view their search history.
################################################################################
*/

//Code
class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String uid = '';
  bool isSet = false;
  API_Interface apiObj = new API_Interface();
  List<dynamic> history = [];

  void loadItems() async {
    history = await apiObj.getSearchHistory(uid);

    setState(() {
      if (history.isNotEmpty) {
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
              'History',
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
                      itemCount: history.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return SearchResultItem(
                            equation: history[index]['equation']['latex'],
                            conf_score:
                                history[index]['similarity'].toString());
                      }),
                )
              : NothingToSeeHere(),
        ],
      ),
    );
  }
}

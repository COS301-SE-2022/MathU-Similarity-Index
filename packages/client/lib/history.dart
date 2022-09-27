//Imports
import 'package:flutter/material.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/noResultsText.dart';
import 'package:client/apiInterface.dart';
import 'package:client/history_item.dart';
import 'package:client/load_icon.dart';

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
  bool isSet = false;
  bool isLoading = false;
  List<dynamic> history = [];

  void loadItems() async {
    setState(() {
      isLoading = true;
    });

    history = await apiObj.getSearchHistory();

    setState(() {
      isLoading = false;
      if (history != null && history.isNotEmpty) {
        isSet = true;
      } else {
        isSet = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (apiObj.getIsLoggedIn()) {
      loadItems();
    }
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const TitleBar(),
      endDrawer: const NavigationDrawer(),
      body: Center(
        child: SizedBox(
          width: 800,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
                child: Text(
                  'History',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              Visibility(
                visible: isLoading,
                child: LoadIcon(),
              ),
              (isSet)
                  ? Expanded(
                      child: ListView.builder(
                          key: const Key("TestListViewBuilder"),
                          shrinkWrap: true,
                          controller: ScrollController(),
                          itemCount: history.length,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return HistoryItem(
                                equation: history[index]['latex'],
                                problemID: history[index]['id']);
                          }),
                    )
                  : const NothingToSeeHere(),
            ],
          ),
        ),
      ),
    );
  }
}

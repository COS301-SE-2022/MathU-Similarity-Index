//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:client/commentItem.dart';

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
  const EquationOverview(
      {Key? key, required this.equation, required this.problemID})
      : super(key: key);

  final String equation, problemID;

  @override
  State<EquationOverview> createState() => _EquationOverviewState();
}

class _EquationOverviewState extends State<EquationOverview> {
  bool isColored = false;
  bool saved = false;
  bool removed = false;
  bool isComments = false;
  List<dynamic> comments = [];

  checkIsSaved(String pid) async {
    List<dynamic> savedResults = await apiObj.getSavedResults();

    if (savedResults.isNotEmpty) {
      for (int i = 0; i < savedResults.length; i++) {
        if (savedResults[i]['equation']['id'] == pid) {
          return true;
        }
      }
      return false;
    } else {
      return false;
    }
  }

  checkIsComments(String pid) async {
    comments = await apiObj.getComments(pid);

    if (comments.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    isColored = checkIsSaved(widget.problemID);
    isComments = checkIsComments(widget.problemID);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: ListTile(
                title: Text(
                  widget.equation,
                  style: TextStyle(
                    letterSpacing: 2.0,
                    wordSpacing: 4.5,
                    fontSize: 24.0,
                  ),
                  //textAlign: TextAlign.center,
                ),
                /* subtitle: Text(
                  'Confidence Rating: ${widget.conf_score}',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    wordSpacing: 2.5,
                  ),
                ), */
                leading: IconButton(
                  onPressed: saveToFavourites,
                  icon: (isColored)
                      ? Icon(Icons.star, color: Colors.amberAccent)
                      : Icon(Icons.star_border_outlined),
                  //color: (isColored) ? Colors.amberAccent : Colors.white,
                ),
              ),
            ),
          ),
          (isComments)
              ? Expanded(
                  child: ListView.builder(
                      key: Key("TestListViewBuilder"),
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: comments.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return CommentItem(
                          comment: comments[index]['comment'],
                          umail: comments[index]['useremail'],
                        );
                      }),
                )
              : NothingToSeeHere(),
        ],
      ),
    );
  }

  void saveToFavourites() {
    /*
    @TODO
    1. Create an API Object
    2. Use API Object to add equation to saved equations
    3. Change icon to be shaded in
    */

    setState(() async {
      isColored = !isColored;

      if (isColored) {
        saved = await apiObj.addSavedResult(widget.problemID);
      } else {
        //removed = await apiObj.removeSavedResult(widget.problemID);
      }
    });
  }
}

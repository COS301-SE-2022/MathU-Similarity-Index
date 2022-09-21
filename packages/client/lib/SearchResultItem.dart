//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/equationOverview.dart';

/*
NOTE
################################################################################
This forms the template of the returned results of the search from the home page
################################################################################
*/

//Code
class SearchResultItem extends StatefulWidget {
  const SearchResultItem(
      {Key? key,
      required this.equation,
      required this.conf_score,
      required this.problemID})
      : super(key: key);
  final String equation, conf_score, problemID;

  @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  bool isColored = false;
  bool isLoggedIn = false;
  bool saved = false;
  bool removed = false;

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

  checkIsLoggedIn() {
    return apiObj.getIsLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    isLoggedIn = checkIsLoggedIn();
    if (isLoggedIn) {
      isColored = checkIsSaved(widget.problemID);
    }
    return Card(
      margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: ListTile(
          onTap: goToEquation,
          title: Text(
            widget.equation,
            style: TextStyle(
              letterSpacing: 2.0,
              wordSpacing: 4.5,
              fontSize: 24.0,
            ),
            //textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Confidence Rating: ${widget.conf_score}',
            style: TextStyle(
              letterSpacing: 1.0,
              wordSpacing: 2.5,
            ),
          ),
          leading: (isLoggedIn)
              ? IconButton(
                  onPressed: saveToFavourites,
                  icon: (isColored)
                      ? Icon(Icons.star, color: Colors.amberAccent)
                      : Icon(Icons.star_border_outlined),
                  //color: (isColored) ? Colors.amberAccent : Colors.white,
                )
              : null,
          trailing: Icon(Icons.arrow_forward_ios),
        ),
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

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (saved || removed)
          ? Text('Yay! Success!')
          : Text('Woops, Something went wrong...'),
      width: 400,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
    ));
  }

  void goToEquation() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => EquationOverview(
                equation: widget.equation,
                conf_score: widget.conf_score,
                problemID: widget.problemID)));
  }
}

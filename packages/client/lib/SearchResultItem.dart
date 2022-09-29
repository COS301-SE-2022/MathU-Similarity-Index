//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/equationOverview.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'dart:convert';
import 'package:math_keyboard/math_keyboard.dart';

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

    if (savedResults != null && savedResults.isNotEmpty) {
      for (int i = 0; i < savedResults.length; i++) {
        if (savedResults[i]['id'] == pid) {
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
  void initState() async {
    super.initState();

    isLoggedIn = checkIsLoggedIn();
    if (isLoggedIn) {
      isColored = await checkIsSaved(widget.problemID);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                )
              : null,
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  void saveToFavourites() {
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
                equation: widget.equation, problemID: widget.problemID)));
  }
}

/*
For Rendering Properly
TeXView(
            child: TeXViewDocument(widget.equation),
            renderingEngine: TeXViewRenderingEngine.mathjax(),
          ),
*/

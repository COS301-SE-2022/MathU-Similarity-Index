//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:client/equationOverview.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'dart:convert';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';
import 'package:universal_html/html.dart';

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
      required this.problemID,
      required this.isSaved})
      : super(key: key);
  final String equation, conf_score;
  final int problemID;
  final bool isSaved;
  @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  bool isColored = false;
  bool isLoggedIn = false;
  bool saved = false;
  bool removed = false;

  checkIsLoggedIn() {
    return apiObj.getIsLoggedIn();
  }

  @override
  void initState() {
    super.initState();

    isColored = widget.isSaved;
  }

  @override
  Widget build(BuildContext context) {
    isLoggedIn = checkIsLoggedIn();
    return Card(
      margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: ListTile(
          title: Math.tex(
            widget.equation,
            textStyle: TextStyle(fontSize: 24),
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
          trailing: IconButton(
            onPressed: goToEquation,
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }

  void saveToFavourites() async {
    bool tempSaved = false;
    bool tempRemoved = false;

    if (!isColored) {
      tempSaved = await apiObj.addSavedResult(widget.problemID);
    } else {
      tempRemoved = await apiObj.removeSavedResult(widget.problemID);
    }

    setState(() {
      isColored = !isColored;

      if (isColored) {
        saved = tempSaved;
        removed = false;
      } else {
        removed = tempRemoved;
        saved = false;
      }
    });

    if (saved) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Yay! Saved Successfully"),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    } else if (removed) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Yay! Removed Successfully"),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Woops, Something Went Wrong..."),
        width: 270,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 1500),
        padding: EdgeInsets.all(10),
      ));
    }
  }

  void goToEquation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquationOverview(
            equation: widget.equation,
            problemID: widget.problemID,
            isSaved: saved),
      ),
    );
  }
}

/*
For Rendering Properly
TeXView(
            child: TeXViewDocument(widget.equation),
            renderingEngine: TeXViewRenderingEngine.mathjax(),
          ),








          Text(
            widget.equation,
            style: TextStyle(
              letterSpacing: 2.0,
              wordSpacing: 4.5,
              fontSize: 24.0,
            ),
          ),




          flutter build web --profile
*/

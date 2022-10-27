//Imports
import 'package:client/equationOverview.dart';
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';

/*
NOTE
################################################################################
This serves as a template for each saved item
################################################################################
*/

//Code
class SavedResultItem extends StatefulWidget {
  const SavedResultItem(
      {Key? key, required this.equation, required this.problemID})
      : super(key: key);

  final String equation;
  final int problemID;

  @override
  State<SavedResultItem> createState() => _SavedResultItemState();
}

class _SavedResultItemState extends State<SavedResultItem> {
  bool saved = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: ListTile(
          title: Math.tex(
            widget.equation,
            textStyle: TextStyle(fontSize: 24),
          ),
          leading: (apiObj.getIsLoggedIn())
              ? IconButton(
                  onPressed: (saved) ? removeFromFavorites : addToFavorites,
                  icon: (saved)
                      ? Icon(Icons.delete_outline)
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

  void removeFromFavorites() async {
    /*
    @TODO
    1. Make an API_Interface Object
    2. Use apiObj to delete item from saved table
    */
    bool successful = await apiObj.removeSavedResult(widget.problemID);

    setState(() {
      bool saved = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (successful)
          ? Text('Yay! Success!')
          : Text('Woops, Something went wrong...'),
      width: 400,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(milliseconds: 1500),
      padding: EdgeInsets.all(10),
    ));
  }

  void addToFavorites() async {
    bool successful = await apiObj.addSavedResult(widget.problemID);

    setState(() {
      bool saved = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: (successful)
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
            problemID: widget.problemID,
            isSaved: saved),
      ),
    );
  }
}

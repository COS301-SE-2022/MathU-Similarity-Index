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
This is the template used to create the widget that would display the history 
results in the history page.
################################################################################
*/

//Code
class HistoryItem extends StatefulWidget {
  const HistoryItem(
      {super.key,
      required this.equation,
      required this.problemID,
      required this.isSaved});

  final String equation;
  final int problemID;
  final bool isSaved;

  @override
  State<HistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<HistoryItem> {
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
          //leading: Icon(Icons.history),
          /* trailing: IconButton(
            onPressed: goToEquation,
            icon: Icon(Icons.arrow_forward_ios),
          ), */
        ),
      ),
    );
  }

  void goToEquation() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquationOverview(
            equation: widget.equation,
            problemID: widget.problemID,
            isSaved: widget.isSaved),
      ),
    );
  }
}

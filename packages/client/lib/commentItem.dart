//Imports
import 'package:flutter/material.dart';
//import 'package:client/apiInterface.dart';

/*
Note
################################################################################
################################################################################
*/

//Code
class CommentItem extends StatelessWidget {
  const CommentItem({Key? key, required this.comment, required this.umail})
      : super(key: key);
  final String comment, umail;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: ListTile(
          isThreeLine: true,
          title: Text(
            this.comment,
            style: TextStyle(
              letterSpacing: 1.15,
              wordSpacing: 2.1,
              fontSize: 16.0,
            ),
            //textAlign: TextAlign.center,
          ),
          subtitle: Text(
            this.umail,
            style: TextStyle(
              letterSpacing: 1.15,
              wordSpacing: 2.1,
              fontSize: 12.0,
            ),
          ),
          leading: Icon(
            Icons.chat_bubble_outline,
          ),
        ),
      ),
    );
  }
}

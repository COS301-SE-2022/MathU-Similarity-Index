//Imports
import 'package:flutter/material.dart';
import 'package:client/apiInterface.dart';

/*
NOTE
################################################################################
This serves as a template for each saved item
################################################################################
*/

//Code
class SavedResultItem extends StatefulWidget {
  const SavedResultItem(
      {Key? key, required this.equation, required this.conf_score})
      : super(key: key);

  final String equation, conf_score;

  @override
  State<SavedResultItem> createState() => _SavedResultItemState();
}

class _SavedResultItemState extends State<SavedResultItem> {
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
          leading: IconButton(
            onPressed: removeFromFavorites,
            icon: Icon(Icons.delete_outline),
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }

  void removeFromFavorites() {
    /*
    @TODO
    1. Make an API_Interface Object
    2. Use apiObj to delete item from saved table
    */
  }

  void goToEquation() {}
}

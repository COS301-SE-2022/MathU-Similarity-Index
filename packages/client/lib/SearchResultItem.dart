//Imports
import 'package:flutter/material.dart';

/*
NOTE
################################################################################
This forms the template of the returned results of the search from the home page
################################################################################
*/

//Code
class SearchResultItem extends StatefulWidget {
  const SearchResultItem(
      {Key? key, required this.equation, required this.conf_score})
      : super(key: key);
  final String equation, conf_score;

  @override
  State<SearchResultItem> createState() => _SearchResultItemState();
}

class _SearchResultItemState extends State<SearchResultItem> {
  bool isColored = false;

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
            //textAlign: TextAlign.center,
          ),
          subtitle: Text(
            'Confidence Rating: ${widget.conf_score}',
            style: TextStyle(
              letterSpacing: 1.0,
              wordSpacing: 2.5,
            ),
          ),
          leading: IconButton(
            onPressed: saveToFavourites,
            icon: (isColored)
                ? Icon(Icons.star, color: Colors.amberAccent)
                : Icon(Icons.star_border_outlined),
            //color: (isColored) ? Colors.amberAccent : Colors.white,
          ),
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

    setState(() {
      isColored = !isColored;
    });
  }

  void goToEquation() {}
}

//Imports
import 'package:flutter/material.dart';

/*
NOTE
################################################################################
This forms the template of the returned results of the search from the home page
################################################################################
*/

//Code
class SearchResultItem extends StatelessWidget {
  final String equation, conf_score;
  const SearchResultItem(
      {Key? key, required this.equation, required this.conf_score})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this.equation),
        subtitle: Text('Confidence Rating ${this.conf_score}'),
        leading: IconButton(
          onPressed: saveToFavourites,
          icon: Icon(Icons.star_border_outlined),
        ),
      ),
    );
  }

  void saveToFavourites() {}
}

//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:client/apiInterface.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
//import 'package:flutter_tex/flutter_tex.dart';

/*
NOTE:
######################################################################
This file will be used to create the home page which will serve as the
point where users will type in their search queries
######################################################################
*/

//Code
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<SearchObject> results = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NavBar(),
      body: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: SearchBar(results: results, history: widget.history),
            ),
            Column(
              children: <Widget>[
                TextButton(
                  child: const Text('History'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/searchhistory.dart');
                  },
                ),
                TextButton(
                  child: const Text('View All'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/viewAllProblems.dart');
                  },
                ),
              ],
            ),
          ),
          /*
          ######################################################################
          Search Results Implemented Here
          ######################################################################
          */
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(),
                itemCount: searchResults.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return SearchResultItem(
                      equation: searchResults[index]['equation']['latex'],
                      conf_score:
                          searchResults[index]['similarity'].toString());
                }),
          ),
        ],
      ),
    );
  }

  void onPressed() async {
    /*
    @TODO
    1. Instantiate an API_Interface object
    2. Use API_Interface object to get search results from query
    3. Build an array of search result tiles using query results
    4. Display search result tiles
    5. If user is logged in then the search query should be added to user 
       history
    */

    API_Interface apiObj = new API_Interface();

    searchResults = await apiObj.getSearchResults(qry);

    if (searchResults.isNotEmpty) {
      setState(() {
        isVisible = true;
      });
    }
  }

  void onPressedForced() {
    API_Interface apiObj = new API_Interface();

    searchResults = apiObj.getSearchResultsForced();

    if (searchResults.isNotEmpty) {
      setState(() {
        isVisible = true;
      });
    }
  }
}

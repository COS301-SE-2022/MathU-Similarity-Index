//Imports
import 'package:client/PrototypeFiles/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:client/apiInterface.dart';
import 'package:flutter_tex/flutter_tex.dart';

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
  //Variable Declarations
  String qry = '';

  List<dynamic> searchResults = [];

  bool isVisible = true;
  //Variable Declarations

  //Math Keyboard
  final MathFieldEditingController textController =
      MathFieldEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
  //Math Keyboard

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[1],
      appBar: AppBar(
        title: Text('MathU Similarity Index'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xFF003255),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*
          ######################################################################
          Search Bar Implemented Here
          ######################################################################
          */
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 800,
                height: 50,
                child: MathField(
                  variables: const ['a', 'b', 'c', 'x', 'y', 'z'],
                  keyboardType: MathKeyboardType.expression,
                  decoration: InputDecoration(
                    hintText: 'eg. x + 3 = 5',
                    border: OutlineInputBorder(),
                    icon: IconButton(
                      onPressed: onPressed,
                      icon: Icon(Icons.search),
                    ),
                  ),
                  controller: textController,
                  onChanged: (value) {
                    try {
                      qry = '${TeXParser(value).parse()}';
                    } catch (_) {
                      qry = 'invalid input';
                    }
                  },
                ),
              ),
            ),
          ),
          /*
          ######################################################################
          Search Results Implemented Here
          ######################################################################
          */
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 0.0),
            child: Visibility(
              visible: isVisible,
              child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return ListTile(
                      title: Text(searchResults[index]['equation']['latex']),
                      subtitle: Text(searchResults[index]['similarity']),
                    );
                  }),
            ),
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
}

//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:client/apiInterface.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:client/homeCarousel.dart';
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
  //Variable Declarations
  String qry = '';

  List<dynamic> searchResults = [];
  List<String> tags = [
    'Equation',
    'Function',
    'Statement',
    'Inequality',
    'Differentiation,',
    'Integration',
    'Limits',
    'Quadratic Equation'
  ];
  List<String> filters = [];

  bool isSearchResultsVisible = false;
  bool isCarouselVisible = true;
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
      backgroundColor: Colors.grey[200],
      appBar: TitleBar(),
      endDrawer: NavigationDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /*
          ######################################################################
          Search Bar Implemented Here
          ######################################################################
          */
          Padding(
            padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 5.0),
            child: Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 800,
                height: 50,
                child: MathField(
                  variables: const ['a', 'b', 'c', 'x', 'y', 'z'],
                  keyboardType: MathKeyboardType.expression,
                  decoration: InputDecoration(
                    hintText: 'x + 3 = 5',
                    border: OutlineInputBorder(),
                    icon: IconButton(
                      key: Key('TestTap'),
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
          (isSearchResultsVisible)
              ? Expanded(
                  child: ListView.builder(
                      key: Key("TestListViewBuilder"),
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: searchResults.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return SearchResultItem(
                          equation: searchResults[index]['equation']['latex'],
                          conf_score:
                              searchResults[index]['similarity'].toString(),
                          problemID: searchResults[index]['equation']['id'],
                        );
                      }),
                )
              : determineFiller(),
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

    searchResults = await apiObj.getSearchResults(qry);

    if (searchResults.isNotEmpty) {
      setState(() {
        isSearchResultsVisible = true;
        isCarouselVisible = false;
      });
    } else {
      setState(() {
        isSearchResultsVisible = false;
        isCarouselVisible = false;
      });
    }
  }

  /*
  determineFiller()
  ##############################################################################
  This function is used to determine whether the carousel should be shown or if
  the NothingToSeeHere widget should be shown.
  */
  Widget determineFiller() {
    if (isCarouselVisible) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: Carousel(),
      );
    } else {
      return NothingToSeeHere();
    }
  }

  /*
  ##############################################################################
  All functions in this section relate to the filter feature
  ##############################################################################
  */

  Widget filterList() {
    return Wrap(
      spacing: 6.5,
      runSpacing: 5,
      children: [],
    );
  }

  bool isFilterSelected(String tag) {
    bool selected = false;

    if (filters.isNotEmpty) {
      for (int i = 0; i < filters.length; i++) {
        if (filters[i] == tag) {
          selected = true;
          return selected;
        }
      }
    }

    return selected;
  }

  bool contains(int i, String tag) {
    bool contains = false;

    if (searchResults.isNotEmpty) {
      if (searchResults[i]['equation']['tags'].isNotEmpty) {
        for (int j = 0; j < searchResults[i]['equation']['tags'].length; j++) {
          if (searchResults[i]['equation']['tags'][j]['name'] == tag) {
            contains = true;
            return contains;
          }
        }
      }
    }

    return contains;
  }

  void swap(int i, int j) {
    var temp = searchResults[i];
    searchResults[i] = searchResults[j];
    searchResults[j] = temp;
  }

  int partition(int l, int h) {
    int x = searchResults[h]['similarity'];
    int i = (l - 1);
    for (int j = l; j <= h - 1; j++) {
      if (searchResults[j]['similarity'] <= x) {
        i++;
        swap(i, j);
      }
    }
    swap(i + 1, h);
    return (i + 1);
  }

  void quicksort(int l, int h) {
    List<int> myList = [h - l + 1];
    int top = -1;
    myList[++top] = l;
    myList[++top] = h;
    while (top >= 0) {
      h = myList[top--];
      l = myList[top--];
      int p = partition(l, h);
      if (p - 1 > l) {
        myList[++top] = l;
        myList[++top] = p - 1;
      }
      if (p + 1 < h) {
        myList[++top] = p + 1;
        myList[++top] = h;
      }
    }
  }

  /*
  Quicksort Algorithm provided by: 
    https://www.tutorialspoint.com/java-program-for-iterative-quick-sort
  ##############################################################################
  */
}

//Imports
import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:client/apiInterface.dart';
import 'package:client/SearchResultItem.dart';
import 'package:client/titlebar.dart';
import 'package:client/NavigationDrawer.dart';
import 'package:client/noResultsText.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:client/homeCarousel.dart';
import 'package:client/load_icon.dart';
import 'package:flutter_tex/flutter_tex.dart';
import 'package:universal_html/html.dart';
import 'dart:convert';

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
  int searchResultsLength = 10;
  int numDivisions = 0;

  List<dynamic> searchResults = [];
  List<int> filters = [];
  List<dynamic> tags = [];

  bool onSearchBarSelected = false;
  bool isSearchResultsVisible = false;
  bool isCarouselVisible = true;
  bool isNothingToSeeHereVisible = false;
  bool showFilterOptions = false;
  bool showFilterSlider = false;
  bool isFilterFunctionVisible = false;
  bool showLoader = false;
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

  @override
  void initState() async {
    // TODO: implement initState
    super.initState();
    tags = await apiObj.getAllTags();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: const TitleBar(),
      endDrawer: const NavigationDrawer(),
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
            child: SizedBox(
              width: 800,
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(5),
                ),
                title: MathField(
                  variables: const ['a', 'b', 'c', '=', 'x', 'y', 'z'],
                  keyboardType: MathKeyboardType.expression,
                  decoration: InputDecoration(
                    hintText: 'x + 3 = 5',
                    border: InputBorder.none,
                  ),
                  controller: textController,
                  onChanged: (value) {
                    print('The input before parse: ' + value);
                    print('The input after parse: ${TeXParser(value).parse()}');
                    try {
                      qry = '${TeXParser(value).parse()}';
                    } catch (_) {
                      qry = 'invalid input';
                    }
                  },
                  onSubmitted: (val) {
                    onPressed();
                  },
                ),
                leading: IconButton(
                  key: Key('TestTap'),
                  onPressed: onPressed,
                  icon: Icon(Icons.search),
                ),
                trailing: IconButton(
                  onPressed: () {
                    textController.clear();
                    if (searchResults != null && searchResults.length > 0) {
                      setState(() {
                        searchResults = [];
                        showFilterOptions = false;
                        showFilterSlider = false;
                        isFilterFunctionVisible = false;
                        isSearchResultsVisible = false;
                        isCarouselVisible = true;
                        searchResultsLength = 1;
                        numDivisions = 1;
                      });
                    }
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          /*
          ######################################################################
          Filter List implemented Here
          ######################################################################
          */
          Visibility(visible: isFilterFunctionVisible, child: Filter()),
          SizedBox(height: 5),
          Visibility(visible: showFilterOptions, child: filterList()),
          Visibility(
              visible: showFilterSlider,
              child: Slider(
                value: (searchResults.isEmpty || searchResults.length == 0)
                    ? 1
                    : searchResultsLength.toDouble(),
                min: 1,
                max: (searchResults.isEmpty || searchResults.length == 0)
                    ? 2
                    : searchResults.length.toDouble(),
                divisions: (searchResults.isEmpty || searchResults.length == 0)
                    ? 1
                    : numDivisions,
                activeColor: Color.fromRGBO(236, 64, 122, 1),
                thumbColor: Color.fromRGBO(236, 64, 122, 1),
                inactiveColor: Colors.grey[600],
                label: searchResultsLength.toString(),
                onChanged: (val) {
                  setState(() {
                    searchResultsLength = val.toInt();
                  });
                },
              )),
          SizedBox(height: 5),
          Visibility(
              visible: isFilterFunctionVisible,
              child: Divider(
                height: 6,
                indent: 50,
                endIndent: 50,
              )),
          /*
          ######################################################################
          Search Results Implemented Here
          ######################################################################
          */
          Visibility(
            visible: showLoader,
            child: LoadIcon(),
          ),
          (isSearchResultsVisible)
              ? Expanded(
                  child: ListView.builder(
                      key: const Key("TestListViewBuilder"),
                      shrinkWrap: true,
                      controller: ScrollController(),
                      itemCount: searchResultsLength,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return SearchResultItem(
                          equation: searchResults[index]['equation']['latex'],
                          conf_score:
                              searchResults[index]['similarity'].toString(),
                          problemID: searchResults[index]['id'].toString(),
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

    print('The submitted query is: $qry');

    setState(() {
      showLoader = true;
      isCarouselVisible = false;
      isNothingToSeeHereVisible = false;
      searchResults = [];
      showFilterOptions = false;
      showFilterSlider = false;
      isFilterFunctionVisible = false;
      isSearchResultsVisible = false;
      searchResultsLength = 1;
      numDivisions = 1;
    });

    searchResults = await apiObj.getSearchResults(qry);
    //searchResults = await apiObj.getSimilaritySearch(qry, filters);
    searchResultsLength = determineSearchResultsListLength();

    if (searchResults != null && searchResults.isNotEmpty) {
      setState(() {
        showLoader = false;
        numDivisions = searchResults.length;
        isSearchResultsVisible = true;
        isFilterFunctionVisible = true;
      });
    } else {
      setState(() {
        numDivisions = 0;
        showLoader = false;
        isSearchResultsVisible = false;
        isFilterFunctionVisible = false;
        isCarouselVisible = false;
        isNothingToSeeHereVisible = true;
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
      return Center(
        //margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        child: const Carousel(),
      );
    } else if (isNothingToSeeHereVisible) {
      return const Center(
        child: NothingToSeeHere(),
      );
    } else {
      return Center(
        child: Text("Searching to the ends of the Earth..."),
      );
    }
  }

  /*
  ##############################################################################
  All functions in this section relate to the filter feature
  ##############################################################################
  */

  /*
  Filter() is used for creating the filter options drop down menu and slider 
  drop down menu
  */
  Widget Filter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
          visible: (tags.isNotEmpty && tags.length > 0),
          child: SizedBox(
            width: 150,
            child: ListTile(
              title: Text("Filters"),
              leading: Icon(Icons.filter_list),
              minLeadingWidth: 2.5,
              onTap: () {
                setState(() {
                  showFilterOptions = !showFilterOptions;
                });
              },
            ),
          ),
        ),
        SizedBox(width: 10),
        Visibility(
          visible: true,
          child: SizedBox(
            width: 200,
            child: ListTile(
              title: Text("Show top $searchResultsLength"),
              leading: Icon(Icons.arrow_drop_down),
              minLeadingWidth: 2.5,
              onTap: () {
                setState(() {
                  showFilterSlider = !showFilterSlider;
                });
              },
            ),
          ),
        ),
        SizedBox(width: 10),
        Visibility(
          visible: true,
          child: SizedBox(
            width: 200,
            child: ListTile(
              title: const Text("Practice Questions"),
              leading: const Icon(Icons.picture_as_pdf),
              minLeadingWidth: 2.5,
              onTap: () {
                _createPDF(searchResults);
              },
            ),
          ),
        ),
      ],
    );
  }

//filterList() specifies the filter options available to the user
  Widget filterList() {
    return Wrap(
      spacing: 6.5,
      runSpacing: 5,
      children: buildFilterOptions(),
    );
  }

  Widget FilterOption(dynamic tag) {
    if (tag != null && tag.isNotEmpty) {
      return FilterChip(
        selectedColor: Color.fromRGBO(236, 64, 122, 1),
        backgroundColor: Color.fromARGB(255, 0, 64, 110),
        checkmarkColor: Colors.white,
        tooltip: tag['description'].toString(),
        label: Text(
          tag['name'],
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        selected: filters.contains(tag['id']),
        onSelected: (val) {
          onFilterSelect(tag['id']);
        },
      );
    } else {
      return SizedBox(width: 1, height: 1);
    }
  }

  List<Widget> buildFilterOptions() {
    if (tags != null && tags.isNotEmpty) {
      List<Widget> temp = [];

      for (int i = 0; i < tags.length; i++) {
        temp.add(FilterOption(tags[i]));
      }

      print(temp);
      return temp;
    } else {
      return [];
    }
  }

/*
onFilterSelect()
This method changes the displayed searchResults array based on which filters
have been selected
*/
  void onFilterSelect(int tag) {
    setState(() {
      if (!filters.contains(tag)) {
        filters.add(tag);
      } else {
        filters.remove(tag);
      }
    });

    onPressed();
  }

/*
moveToFront()
This method organises the displayed searchResults array so that filtered items
appear at the beginning.
*/
  /* void moveToFront() {
    if (filters.isNotEmpty && searchResults.isNotEmpty) {
      for (int i = searchResults.length - 1; i >= 0; i--) {
        for (int j = 0; j < filters.length; j++) {
          if (containsFilterTag(i, filters[j])) {
            searchResults.insert(0, searchResults[i]);
            searchResults.removeAt(i + 1);
            break;
          }
        }
      }
    }
  } */

/*
containsFilterTag(i, tag)
This method checks if searchResults[i] contains the specified filter tag called
tag.
*/
  bool containsFilterTag(int i, String tag) {
    bool contains = false;

    if (searchResults.isNotEmpty &&
        searchResults[i]['equation']['tags'].isNotEmpty) {
      for (int j = 0; j < searchResults[i]['equation']['tags'].length; j++) {
        if (searchResults[i]['equation']['tags'][j]['name'] == tag) {
          contains = true;
          return contains;
        }
      }
    }

    return contains;
  }

/*
determineSearchResultsListLength()
This function is used to etermine how many search result items should be 
displayed at first.
*/
  int determineSearchResultsListLength() {
    if (searchResults.isNotEmpty) {
      return searchResults.length;
    }
    return 0;
  }

  /*
  Everything below here is relevant to the quicksort algorithm.
  ##############################################################################
  */

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

  Future<void> _createPDF(List<dynamic> searchResults) async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();

    page.graphics.drawString(
        'MathU Practice Tests', PdfStandardFont(PdfFontFamily.helvetica, 30));

    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 15),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 2);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Row';
    header.cells[1].value = 'Question';

    for (var i = 0; i < 10; i++) {
      PdfGridRow row = grid.rows.add();
      row.cells[0].value = (i + 1).toString();
      row.cells[1].value = searchResults[i]['equation']['latex'];
    }

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 50, 0, 0));

    List<int> bytes = document.saveSync();
    document.dispose();

    saveAndLaunchFile(bytes, 'MathUPracticeQuestions.pdf');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    AnchorElement(
        href:
            "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download", fileName)
      ..click();
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

    searchResults = searchResults.reversed.toList();
  }

  /*
  Quicksort Algorithm provided by: 
    https://www.tutorialspoint.com/java-program-for-iterative-quick-sort
  ##############################################################################
  */
}

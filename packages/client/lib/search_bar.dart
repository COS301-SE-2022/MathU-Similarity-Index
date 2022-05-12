import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String qry = '';
  final TextEditingController textController = TextEditingController();

  List<SearchObject> results = [
    SearchObject("2x+3", 100),
    SearchObject("y-12", 100),
    SearchObject("(2x-6)/8", 100),
    SearchObject("x^2+9x+12", 100)
  ];
  List<String> history = [];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(15, 15, 15, 15),
      //padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      //width: 150,
      //height: 500,
      //constraints: null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: TextField(
              //maxLength: 50,
              controller: textController,
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.search),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return Text(results[index].toDisplayString());
                }),
          )
        ],
      ),
    );
  }

  void onPressed() {
    qry = textController.text;
    addToHistory();
    calculateConf();
    orderResults();

    print("The results array: \n");
    print(results);
    print("#####################");

    print("The history array: \n");
    print(history);
    print("#####################");
  }

  void orderResults() {
    SearchObject temp;

    for (int i = 1; i < results.length - 1; i++) {
      for (int j = i - 1; j < i; j++) {
        if (results[i].getConf() < results[j].getConf()) {
          temp = results[j];
          results[j] = results[i];
          results[i] = temp;
        }
      }
    }
  }

  void calculateConf() {
    int count = 0;

    for (int i = 0; i < results.length; i++) {
      for (int j = 0; j < results[i].getTerm().length; j++) {
        if (qry[j] != results[i].getTerm()[j]) {
          count++;
        }
      }

      results[i].setConf(results[i].getConf() - count);
      count = 0;
    }
  }

  void addToHistory() {
    if (history.isNotEmpty) {
      bool inHistory = false;

      for (int i = 0; i < history.length - 1; i++) {
        if (qry.compareTo(history[i]) == 0) {
          inHistory = true;
        }
      }

      if (inHistory == false) {
        history.add(qry);
      }
    } else {
      history.add(qry);
    }
  }
}

class SearchObject {
  String term = "";
  int conf = 0;

  SearchObject(String t, int c) {
    term = t;
    conf = c;
  }

  setConf(int c) {
    conf = c;
  }

  String toDisplayString() {
    return term + "       " + conf.toString();
  }

  String getTerm() {
    return term;
  }

  int getConf() {
    return conf;
  }
}

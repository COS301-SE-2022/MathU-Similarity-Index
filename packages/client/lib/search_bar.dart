import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String qry = '';
  Icon _searchIcon = new Icon(Icons.search);

  final textController = new TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
        actions: [IconButton(onPressed: onPressed, icon: Icon(Icons.search))],
      ),
      /*body: new ListView.builder(
          itemCount: results.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return new Text(results[index].toDisplayString());
          }),*/
      body: Text(qry),
    );
  }

  void onPressed() {
    qry = textController.text;
    addToHistory();
    calculateConf();
    orderResults();
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
    return term + " " + conf.toString();
  }

  String getTerm() {
    return term;
  }

  int getConf() {
    return conf;
  }
}

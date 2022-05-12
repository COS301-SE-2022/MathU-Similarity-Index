import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String qry = '';
  bool isVisible = false;
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
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      //padding: EdgeInsets.fromLTRB(3, 3, 3, 3),
      //width: 150,
      //height: 500,
      //constraints: null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                  ),
                  controller: textController,
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 500,
                child: Visibility(
                  visible: isVisible,
                  child: ListView.builder(
                      itemCount: results.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return ListTile(
                            title: Text(results[index].toDisplayString()));
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void onPressed() {
    setState(() {
      isVisible = true;
      qry = textController.text;
      addToHistory();
      calculateConf();
      orderResults();
    });

    //printResults();

    //print("The history array:");
    //print(history);
    //print("#####################");
  }

  void printResults() {
    print("######The Results array:######");
    for (int i = 0; i < results.length; i++) {
      print(results[i].toDisplayString());
    }
    print("##############################");
  }

  void orderResults() {
    SearchObject temp;

    for (int i = 0; i < results.length; i++) {
      for (int j = i + 1; j < results.length; j++) {
        if (results[i].getConf() < results[j].getConf()) {
          temp = results[j];
          results[j] = results[i];
          results[i] = temp;
        }
      }
    }
  }

  void calculateConf() {
    //print("Start calculateConf Debug\n");

    int confScore = 100;
    int minLength = 0;
    String word = "";

    //For loop for looping through each word in results array
    for (int i = 0; i < results.length; i++) {
      word = results[i].getTerm();
      //print("The term being assesed: " + word + "\n");
      //For loop for looping through each character in word
      minLength = (qry.length < word.length) ? qry.length : word.length;

      //Factoring difference in length between terms to calculate confScore
      if (qry.length > word.length) {
        confScore -= qry.length - word.length;
      } else {
        confScore -= word.length - qry.length;
      }

      //Factoring difference in character to calculate confScore
      for (int j = 0; j < minLength; j++) {
        //print("qry[j] = " + qry[j] + " ||||| " + "term[j] = " + word[j]);
        //print("Are they not equal? " + (qry[j] != word[j]).toString() + "\n");
        if (qry[j] != word[j]) {
          confScore--;
        }
      }

      results[i].setConf(confScore);
      confScore = 100;

      /*print("The confidence score of " +
          results[i].getTerm() +
          " is: " +
          results[i].getConf().toString() +
          "\n");
      print("The term being assesed: " + word + " is done");*/
    }

    //print("End calculateConf Debug");
  }

  void addToHistory() {
    //print("Start of History Array Debug\n##############################");

    //print("History Array Size: " + history.length.toString());
    if (history.isEmpty) {
      //print("Added to empty history string");
      history.add(qry);
    } else {
      bool isInHistory = false;
      //print("Is in History start: " + isInHistory.toString());
      for (int i = 0; i < history.length; i++) {
        //print("Word Being compared: " + history[i]);
        //print("Compare to function: " +
        //(qry.compareTo(history[i]) == 0).toString());
        if (qry.compareTo(history[i]) == 0) {
          isInHistory = true;
          //print("isInHistory change: " + isInHistory.toString());
          break;
        }
      }

      if (!isInHistory) {
        //print("Added to history array!");
        history.add(qry);
      }
    }

    //print("End of History Array Debug\n##############################");
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

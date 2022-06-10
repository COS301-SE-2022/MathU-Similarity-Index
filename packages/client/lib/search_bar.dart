import 'package:flutter/material.dart';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:http/http.dart';
import 'dart:convert';

class SearchBar extends StatefulWidget {
  final List<SearchObject> results;
  final List<String> history;

  const SearchBar({Key? key, required this.results, required this.history})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String qry = '';
  bool isVisible = false;
  final MathFieldEditingController textController =
      MathFieldEditingController();

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                width: 500,
                height: 50,
                child: MathField(
                  variables: const ['x', 'y', 'z'],
                  keyboardType: MathKeyboardType.expression,
                  decoration: InputDecoration(
                    hintText: 'eg. x + 3 = 5',
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
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  /*width: 500,
                height: 500,*/
                  child: Visibility(
                    visible: isVisible,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.results.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return ListTile(
                              title: Text(
                                  widget.results[index].toDisplayString()));
                        }),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    setState(() {
      isVisible = true;
      // qry = textController.Text;
      addToHistory();
      sendSearchData();
    });

    //printResults();

    //print("The history array:");
    //print(widget.history);
    //print("#####################");
  }

  void sendSearchData() async {
    String query = 'query search{Search(input: "test"){numberofresults,equations{equation{id,mathml},similarity}}}';

    Uri url = Uri.parse("http://127.0.0.1:5000/graphql");
    Response response = await post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'query': query,
    }),
  );
    Map data = jsonDecode(response.body.toString());
    print(data);
  }

  void printResults() {
    print("######The Results array:######");
    for (int i = 0; i < widget.results.length; i++) {
      print(widget.results[i].toDisplayString());
    }
    print("##############################");
  }

  void orderResults() {
    SearchObject temp;

    for (int i = 0; i < widget.results.length; i++) {
      for (int j = i + 1; j < widget.results.length; j++) {
        if (widget.results[i].getConf() < widget.results[j].getConf()) {
          temp = widget.results[j];
          widget.results[j] = widget.results[i];
          widget.results[i] = temp;
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
    for (int i = 0; i < widget.results.length; i++) {
      word = widget.results[i].getTerm();
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

      widget.results[i].setConf(confScore);
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
    if (widget.history.isEmpty) {
      //print("Added to empty history string");
      widget.history.add(qry);
    } else {
      bool isInHistory = false;
      //print("Is in History start: " + isInHistory.toString());
      for (int i = 0; i < widget.history.length; i++) {
        //print("Word Being compared: " + history[i]);
        //print("Compare to function: " +
        //(qry.compareTo(history[i]) == 0).toString());
        if (qry.compareTo(widget.history[i]) == 0) {
          isInHistory = true;
          //print("isInHistory change: " + isInHistory.toString());
          break;
        }
      }

      if (!isInHistory) {
        //print("Added to history array!");
        widget.history.add(qry);
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

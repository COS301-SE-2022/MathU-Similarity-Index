//REFERENCING IS AT BOTTOM OF PAGE
import 'package:flutter/material.dart';

class SearchHistory extends StatelessWidget {
  var resultList = <String>[];
  SearchHistory(List<String> abc) {
    this.resultList = abc;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MATHU SEARCH HISTORY',
      home: SearchHistoryList(resultList),
    );
  }
}

class _SearchHistoryListState extends State<SearchHistoryList> {
  var ResultList = <String>[];
  _SearchHistoryListState(List<String> abc) {
    this.ResultList = abc;
  }

  final _saved = <String>{};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MATHU SEARCH HISTORY'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Answers',
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ResultList.length,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          final alreadySaved = _saved.contains(ResultList[index]);

          return ListTile(
            leading: Icon(Icons.history),
            title: Text(
              ResultList[index],
              style: _biggerFont,
            ),
            trailing: Icon(
              alreadySaved ? Icons.favorite : Icons.favorite_border,
              color: alreadySaved ? Colors.blue : null,
              semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
            ),
            onTap: () {
              setState(() {
                if (alreadySaved) {
                  _saved.remove(ResultList[index]);
                } else {
                  _saved.add(ResultList[index]);
                }
              });
            },
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Answers'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

class SearchHistoryList extends StatefulWidget {
  var resultList = <String>[];
  SearchHistoryList(List<String> abc) {
    this.resultList = abc;
  }

  @override
  State<SearchHistoryList> createState() => _SearchHistoryListState(resultList);
}

//REFERENCES
/*
Write your first Flutter app, part 1 -> OFFICIAL FLUTTER SITE (https://docs.flutter.dev/get-started/codelab)
Write Your First Flutter App, part 2 -> OFFICIAL FLUTTER SITE (https://codelabs.developers.google.com/codelabs/first-flutter-app-pt2#0)

CONSTRUCTORS DART/FLUTTER TUTORIALS -> Dart/Flutter Constructors tutorial with examples URL(https://www.bezkoder.com/dart-flutter-constructors/)
                                        Calling a function with an array of parameters in Dart URL(https://stackoverflow.com/questions/42965731/calling-a-function-with-an-array-of-parameters-in-dart)
                                        ARRAYS IN FLUTTER URL(https://www.fluttercampus.com/guide/198/array-list-basics-dart-flutter/)
*/
